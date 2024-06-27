# INSTRUCTIONS- This Works
#########
## 1a
#########
Read this README

#########
## 1b
#########
# DOCKER CONTAINER
docker run  --rm  -it  --entrypoint   /usr/bin/bash  -v  F:\DOCKER:/share   centos:latest
cd  /share/1-work
[root@d4f1ebddaad2 share]# cd 1-work
[root@d4f1ebddaad2 1-work]# ls
1a-README.txt  1b-rpm-list.bash  2a2b-Dockerfile-tmp  WORKS  WORKS2  WORKS3
[root@d4f1ebddaad2 1-work]#
[root@d4f1ebddaad2 1-work]# ./1b-rpm-list.bash     

exit

#########
## 2
#########
# POWERSHELL
PS F:\DOCKER\1-work> Set-Variable -Name FFF -Value "F:/DOCKER/mylog.txt"
# Set-Variable  -Name  FFF  -Value  "F:/DOCKER/mylog.txt"
# Start-Transcript  $FFF
Transcript started, output file is F:/DOCKER/mylog.txt
PS F:\DOCKER\1-work>     

Start-Transcript
PS F:\DOCKER\1-work> Start-Transcript   
Transcript started, output file is C:\Users\Antman\Documents\PowerShell_transcript.HEROS.VBRhzOkp.20210124164402.txt
PS F:\DOCKER\1-work>    
cd /DOCKER/2-download

docker  build  -f   2a2b-Dockerfile-tmp  -t  centos-work:latest   .   --progress=plain  --no-cache
docker  build  -f   2a-Dockerfile-tmp  -t  centos-work:latest   .   --progress=plain  --no-cache
Stop-Transcript
PS F:\DOCKER\2-download> Stop-Transcript
Transcript stopped, output file is C:\Users\Antman\Documents\PowerShell_transcript.HEROS.VBRhzOkp.20210124164402.txt
PS F:\DOCKER\2-download>
#########
## 3
#########
docker   save   -o  centos-work.tar  centos-work:latest
######## 3a
docker  load   -i   centos-work.tar
PS F:\DOCKER\2-download> docker load -i centos-work.tar
d6540119a6a8: Loading layer [==================================================>]   2.56kB/2.56kB                     5f70bf18a086: Loading layer [==================================================>]  1.024kB/1.024kB                    613de19955a3: Loading layer [==================================================>]  304.6MB/304.6MB                    e9a9caeb29ba: Loading layer [==================================================>]  760.4MB/760.4MB                    9bc32efacc12: Loading layer [==================================================>]  6.111MB/6.111MB                    6237160d47fc: Loading layer [==================================================>]  25.68MB/25.68MB                    1dabffef8955: Loading layer [==================================================>]  41.31MB/41.31MB                    512b758a2a6c: Loading layer [==================================================>]  40.96kB/40.96kB                    668025e1c27d: Loading layer [==================================================>]    243MB/243MB                      Loaded image: centos-work:latest
#3aa To inspect image in docker
docker image inspect centos-work:latest

####3b to shrink image size perform the following:
1.  docker run -it centos-work bash
2.  exit command line 
3. docker ps -a
CONTAINER ID   IMAGE         COMMAND   CREATED         STATUS                      PORTS     NAMES

08133347bb6c   centos-work   "bash"    3 minutes ago   Exited (2) 19 seconds ago             cranky_hopper

4.  PS F:\DOCKER\2-download> docker start cranky_hopper
5. PS F:\DOCKER\2-download> docker save -o centos-work.tar centos-work:latest
6. PS F:\DOCKER\2-download> docker export -o centosv2.tar cranky_hopper
7. PS F:\DOCKER\2-download> docker import centosv2.tar centosv2-work:latest
sha256:4315ea4cd8c4eb6cabeeed4f9dcf3ab5ea41d6f77c10f3af720316341a4c09be

###3 c Docker image inspect
docker image inspect centosv2-workls


##4 Clean up 2-downloads  clang through python packages.
In windows highlight shift-key scroll down and delete all packages.
To make clean for next build. 
###5 Clean up Docker dangling images, containers etc.
docker system df  
docker system prune 
docker system prune --volumes
docker system prune --all
docker stop $(docker ps -a -q) && docker system prune --volumes -f
