#!/bin/bash-This Works
#
# run this inside of container
#

export LC_ALL=C.UTF-8



echo 'PART 1/2 ========= DOWNLOAD PYTHON PACKAGE FILES TO DOCKER SHARED VOLUME'


declare -a pypkg=(
'colorama'
'matplotlib'
'numpy'
'pandas'
'pyserial'
'scipy'
'xlrd'
)


echo 'INSTALL PYTHON INTO CONTAINER'
echo 'install python3 --start rpm python INSTALL-------'
dnf    install    -q   -y python3
echo 'install python3 --end--'


for PYPKG in ${pypkg[@]}
do
   echo $PYPKG  ' --start python package download-------'
   pip3  download  -d  /share/2-download/$PYPKG   $PYPKG
   echo $PYPKG  ' --end--'
done

#### cp -R  /share/3-downloadpy/*  /share/2-download
echo 'PYTHON DONE'


cp       /share/1-work/2a-Dockerfile  /share/2-download/2a-Dockerfile-tmp
ls -la   /share/2-download/2a-Dockerfile*




echo 'PART 2/2 ========= DOWNLOAD LINUX RPM FILES TO DOCKER SHARED VOLUME'
sleep 3


declare -a prgm_list=(
'clang'
'gcc'
'cmake'
'curl-devel'
'diffutils'
'dos2unix'
'expat-devel'
'file'
'gcc'
'gcc-c++'
'gcc-toolset-10-gcc-gdb-plugin'
'gdb'
'gettext'
'glibc'
'iptables'
'make'
'ncurses'
'net-tools'
'openjpeg2-tools'
'openssh-clients'
'openssl-devel'
'procps*'
'tree'
'vim'
'which'
'xterm'
)

declare -a prgm_list2=(
'gcc'
)


for PRGM in ${prgm_list[@]}
do
     echo $PRGM '--start rpm file download-------'
     dnf   install  -q  -y  --downloadonly  --downloaddir  /share/2-download/$PRGM  $PRGM  
     echo $PRGM '--end--'	
done

echo 'glibc.i686 --start rpm file download-------'
dnf   install  -q  -y  --downloadonly  --downloaddir  /share/2-download/glibc.i686    glibc*.i686
echo 'glibc.i686 --end--'


# echo 'glibc-static --start rpm file download-------'
# dnf   install  -q  -y  --downloadonly  --downloaddir  /share/2-download/glibc-static    glibc-static
# echo 'glibc-static --end--'


# echo 'libstdc++ --start rpm file download-------'
# dnf   install  -q  --enablerepo=PowerTools  -y  --downloadonly  --downloaddir  /share/2-download/libstdc++static   libstdc++-static
# echo 'libstdc++ --end--'


echo 'update --start rpm file download update-------'
dnf   update  -q   -y  --downloadonly  --downloaddir  /share/2-download/update
echo 'update --end--'

ls  /share/2-download
echo 'RPM DONE'
sleep 2



echo '=========================================================================='
echo 'copy is DONE.  Ready to exit Container and inside PowerShell run docker build ....'
echo 'cd  F:/DOCKER/2-download, and run ...'
echo 'docker  build  -f   2a-Dockerfile-tmp  -t centos-work:latest  .  --progress=plain  --no-cache'
echo '=========================================================================='

 


     	 





