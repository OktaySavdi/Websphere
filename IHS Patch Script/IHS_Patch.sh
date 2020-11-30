#!/bin/bash
shopt -s extglob
#      shopt -u extglob
declare -i debugEnabled=0
declare ihsPath="/opt/IBMIHS"
declare VERSION_9_0="9.0.0.0"
declare VERSION_8_5="8.5.5.0"
declare MAX_VERSION_9_0="9.0.0.11"
declare MAX_VERSION_8_5="8.5.5.18"
declare C_LINUX="linux"
declare C_AIX="aix"
declare -l os
declare fullFixDirectoryPath
declare CONTROLFOLDER
declare loggerFile
declare SCRIPT_NAME="IHS_UPGRADE"
declare fixDirectoryPath="MY_IMAGES/IHS_PATCH/"
declare -i ihsStoppedFlag=1
declare -i temp=0
declare backupFileName
declare parentDirectory
declare -a rmBlackListDirArray=(log ssl conf)
declare -a dirArray=()
declare -a pids=()
declare files
declare http_filepath="/opt/IBMIHS/conf/httpd.conf"

function parallelExecPrevent (){
    echo "$(hostname)-Run Parallel Execution Preventing Algorithm"
    CONTROLFOLDER="/tmp/${SCRIPT_NAME}$(date +"%Y%m%d")"
    echo "$(hostname)-CONTROLFOLDER $CONTROLFOLDER"

    while ! mkdir "$CONTROLFOLDER" 2>/dev/null
    do
        echo "Another script execution is in progress."
        echo "$(hostname)-Exit 0"
        exit 0
    done
    loggerFile="/tmp/logs$(date +"%Y%m%d")"
    >"$loggerFile"
}

function rmControlFolder (){
    rm -rf "$CONTROLFOLDER"
}

function checkDiskSize () {
    if [ $(cat /etc/system-release-cpe  | cut -f5 -d: | cut -c1) -gt 6 ]; then
        echo "$(hostname)-Check Disk Size"
        for path in "/opt/IBMIHS" "/opt/log"; do
            size=$(df -m | grep $path | awk '{print $4}')
            if [ $size -gt 1024 ]; then
                 echo "$(hostname)- ($path) Disk Size OK"
            else
                 echo "$(hostname)- ($path) Disk Size is NOK"
                 exit 100
            fi        
        done  
    else
        echo "$(hostname)-Check Disk Size"
        for path in "/opt/IBMIHS" "/opt/log"; do
            size=$(df -m | grep $path | awk '{print $3}')
            if [ $size -gt 1024 ]; then
                 echo "$(hostname)- ($path) Disk Size OK"
            else
                 echo "$(hostname)- ($path) Disk Size is NOK"
                 exit 100
            fi        
        done  
    fi     
}

function checkIHS () {
    if [[ ! -f "$ihsPath/bin/apachectl" ]]
    then
        echo "$(hostname)-IHS is not installed"
        rmControlFolder
        echo "$(hostname)-Exit 0"
        exit 0
    fi
    echo "$(hostname)-IHS installed"
}

function checkWas () {
    if [[ -f "$http_filepath" ]]
    then
        if grep -E  '^WebSpherePluginConfig' "$http_filepath"  | grep "plugin-cfg.xml" >/dev/null;
        then
            echo "$(hostname)-WAS exists. Upgrade cannot be performed"
            rmControlFolder
            echo "$(hostname)-Exit 0"
            exit 0
        fi
    else
        echo "$(hostname)-Httpd.conf file does not exist"
        rmControlFolder
        echo "$(hostname)-Exit 1"
        exit 1
    fi
    echo "$(hostname)-WAS not exist. script will continue ..."
}

function getIhsVersion () {
    ihsVersion=$($ihsPath/bin/apachectl -v 2>/dev/null| grep IBM_HTTP_Server | awk -F "/" '{print $2}' | awk -F " " '{print $1}')

    if [[ -z "$ihsVersion" ]] 
    then
     echo "$(hostname)-cannot acquire version info"
     rmControlFolder
     echo "$(hostname)-Exit 2"
     exit 2
    fi
    echo "$(hostname)-version before fix operation : $ihsVersion"
}

function checkUpgradeNecessary () {
    echo "$(hostname)-Application version number : $ihsVersion"

    if testvercomp "$ihsVersion"  "$VERSION_8_5"  "="  || ( testvercomp "$ihsVersion" "$VERSION_8_5"  ">"  && testvercomp "$ihsVersion" "$MAX_VERSION_8_5" "<" )
    then
        fixFileName="IHS-${MAX_VERSION_8_5}-patch.tar"

    elif testvercomp "$ihsVersion"  "$VERSION_9_0"  "="  || ( testvercomp "$ihsVersion" "$VERSION_9_0"  ">"  && testvercomp "$ihsVersion" "$MAX_VERSION_9_0" "<" )
    then
        fixFileName="IHS-${MAX_VERSION_9_0}-patch.tar"   
    else
    if [[ $ihsVersion = "$MAX_VERSION_8_5" || $ihsVersion = "$MAX_VERSION_9_0" ]]
    then
        echo "$(hostname)-Already uptodate"
        rmControlFolder
        echo "$(hostname)-Exit 0"
        exit 0
    else
        echo "$(hostname)-No fix prepared for version: $ihsVersion"
        rmControlFolder
        echo "$(hostname)-Exit 3"
        exit 3
    fi
    fi
    echo "$(hostname)-Fix file name :"$fixFileName
}

function vercomp {
    if [[ "$1" == "$2" ]]
    then
        return 0
    fi

    local IFS=.
    ver1=($1)
    ver2=($2)

    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
   
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
      
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then        
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

function testvercomp () {
    vercomp $1 $2

    case $? in
        0) op='=';;
        1) op='>';;
        2) op='<';;
    esac

    if [[ "$op" != "$3" ]]
    then
      return 1
    else
      return 0
    fi
}

function getNetworkPath () {
  [[ $debugEnabled -eq 0 ]] && { echo "$(hostname)-Debug: In getNetworkPath start"; }
  os=$(uname)
  echo "$(hostname)-uname: $os"

  if [[ "$os" =  "$C_LINUX" ]]
  then
      echo "$(hostname)-Linux Machine"
      fullFixDirectoryPath=/Mypath/"$fixDirectoryPath"
  elif [[ "$os" =  "$C_AIX" ]]
  then
      echo "$(hostname)-Aix Machine"
      fullFixDirectoryPath=/Mypath/aix/"$fixDirectoryPath"
  else
      echo "$(hostname)-Not AIX-Not Linux"
      rmControlFolder
      echo "$(hostname)-Exit 4"
      exit 4
  fi

  if [[ ! -f "$fullFixDirectoryPath/$fixFileName" ]]
  then
      echo "$(hostname)-Patch file is not available or not accessible"
      rmControlFolder
      echo "$(hostname)-Exit 5"
      exit 5
  fi 
  [[ $debugEnabled -eq 0 ]] && { echo "$(hostname)-Debug: In getNetworkPath end"; }
}


function stopIHS(){
    echo "$(hostname)-Check current http processes"
    temp=$(ps -ef | grep "[/]opt/IBMIHS/bin/httpd" | wc -l)
    if [[ $temp -gt 0 ]]
    then
      echo "$(hostname)-There are $temp running httpd processes"
      /opt/IBMIHS/bin/apachectl -k stop  || { echo "$(hostname)-Ihs stop command failed"; rmControlFolder; echo "$(hostname)-Exit 6";exit 6;}
      echo "$(hostname)-Sleep 5 seconds"
      sleep 5
      temp=$(ps -ef | grep "[/]opt/IBMIHS/bin/httpd" | wc -l)
      if [[ $temp -gt 0 ]]
      then
         echo "$(hostname)-httpd processes will be killed"
         pids=()
         while read -r line
         do
            pids+=("$line");
         done < <(ps -ef | grep "[/]opt/IBMIHS/bin/httpd" | awk '{print $2}')
#pipeline commands are run in subprocesses, changes made to a variable inside a pipeline command will not propagate to outside it
#         ps -ef | grep "[/]opt/IBMIHS/bin/httpd" | awk '{print $2}' | while  read -r line; do pids+=("$line"); done
         kill -9 ${pids[@]}
         echo "$(hostname)-Sleep 1 second"
         sleep 1
         temp=$(ps -ef | grep "[/]opt/IBMIHS/bin/httpd" | wc -l)
         if [[ $temp -gt 0 ]]
         then
            echo "$(hostname)-httpd processes are still alive"
            rmControlFolder
            echo "$(hostname)-Exit 7"
            exit 7
         else
            echo "$(hostname)-httpd processes are killed"
         fi
      fi
      ihsStoppedFlag=0
    else
      echo "$(hostname)-Already no running httpd processes"
    fi
}

function startIHS(){
    if [[ $ihsStoppedFlag -eq 0 ]]
    then
       /opt/IBMIHS/bin/apachectl -k start  || { echo "$(hostname)-Warning. IHS not started"; rmControlFolder;echo "$(hostname)-Exit 8"; exit 8;}
       echo "$(hostname)-IHS started succesfully"
    else
       echo "$(hostname)-IHS was inactive in the begining"
    fi
}

function getBackup(){
    echo "$(hostname)-Backup procedure will be executed"
    backupFileName="ihs_backup_$(date +%Y%m%d_%H%M%S).tar"
    parentDirectory="$(dirname "$ihsPath")"
    echo "$(hostname)-parentDirectory:${parentDirectory}"
    echo "$(hostname)-upgrade will be performed. Get a tar archive file $backupFileName"
    echo "$(hostname)-Backup operation-tar create" >> "$loggerFile" 2>&1
    
    if ! tar --exclude='./log*' -cvf  "$parentDirectory/$backupFileName"  -C "$ihsPath" . >> "$loggerFile" 2>&1;
    then
      echo "$(hostname)-Cannot get a backup file"
      if [[ -f "$parentDirectory/$backupFileName" ]]
      then
         
         if ! rm "$parentDirectory/$backupFileName" ;
         then
            echo "$(hostname)-Backup procedure - backup file connot be deleted"
         else
            echo "$(hostname)-Backup procedure - backup file  deleted"
            startIHS
         fi
      else
        startIHS
      fi
      rmControlFolder
      echo "$(hostname)-Exit 9"
      exit 9
    fi
    echo "$(hostname)-Backup procedure completed"
}

function deleteFiles (){
    if ! rm -rf "${ihsPath:?}"/!(log*|conf*|ssl*)
    then
        echo "$(hostname)-DeleteFiles-rm command failed"
        rollback
    fi
}

function checkInBlackList () {
    echo "$(hostname)-Black list check for $1"

    for j in "${rmBlackListDirArray[@]}"
    do
       if [[ "$1" == "$j"* ]]
       then
          return 0
       fi
    done
    return 1
}

function applyPatch(){
    echo "$(hostname)-Patch operation-tar extract" >> "$loggerFile" 2>&1
    
    if ! tar -xvf  "$fullFixDirectoryPath/$fixFileName"  -C "${ihsPath}/" >> "$loggerFile" 2>&1 ;
    then
        echo "$(hostname)-Patch operation- tar extract operation failed"
        rollback
    fi
    echo "$(hostname)-Patch operation- patch applied succesfully"
}


function rollback(){
    echo "$(hostname)-Rollback operation will be executed"
    if [[ -f "$parentDirectory/$backupFileName" ]]
    then     

      if ! rm -rf "${ihsPath:?}"/!(log*)
      then
        echo "$(hostname)-Rollback operation- Could not delete directory : ${ihsPath}"
        rmControlFolder
        echo "$(hostname)-Exit 10"
        exit 10
      fi
      echo "$(hostname)-Rollback operation- directory : ${ihsPath} deleted"
      echo "$(hostname)-Rollback operation-tar extract" >> "$loggerFile"
      if ! tar -xvf  "$parentDirectory/$backupFileName"  -C "${ihsPath}/" >> "$loggerFile" 2>&1 ;
      then
        echo "$(hostname)-Rollback operation- tar extract operation failed"
        rmControlFolder
        echo "$(hostname)-Exit 11"
        exit 11
      fi
      echo "$(hostname)-Rollback operation- tar extract succesfully"
      startIHS
    else
      echo "$(hostname)-Rollback operation-could not find backup file."
    fi
    rmControlFolder
    echo "$(hostname)-Exit 12"
    exit 12
}

# is not allowed to run differently in parallel
parallelExecPrevent
# Check if there is enough space on the disk
checkDiskSize
# Exits if IHS is not available
checkIHS
# Exits if there is WAS plugin definition in httpd.conf
checkWas
# IHS version is checked
getIhsVersion
# It is checked whether a fix is necessary or not. Exits if not required
checkUpgradeNecessary
# Is the required Patch file accessible if fix is required? Exit if inaccessible
getNetworkPath
# If the http process is open, it is closed. Exits if not closed
stopIHS
# Existing IBMIHS backup is taken. If an error occurs during backup, it will exit. If the process is closed by the script, the process is opened and exited.
getBackup
# All the directories under IBMIHS that start with ssl, log, conf names will be deleted. If there is a problem with deleting, it can be exited with Rollback. (It restores from the Rollback backup. Opening the process if necessary)
deleteFiles
# The patch file opens under IBMIHS. If it is not opened, exit with Rollback.
applyPatch
# If the script has closed the process, it tries to open it. If it cannot be opened, an error is returned.
startIHS
# Version control is done after the last patch.
getIhsVersion

#Exit with  Exit Code 0.
rmControlFolder
echo "$(hostname)-Exit 0"
exit 0
