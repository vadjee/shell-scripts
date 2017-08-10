
shell-scripts examples
=====

chmod. change the permissions of files or directories
-----
```sh
#chmod options permissions fileName
#chmod u=rwx,g=rx,o=r myfile
#chmod 754 myfile
# 4 stands for "read" 
# 2 stands for "write" 
# 1 stands for "execute"
# 0 stands for "no permission."
# 7 = rwx, 5=rx, 4 = r

# add exutable
chmod +x fuse_start_debug.sh
# set rwx
sudo chmod 777 /var/run/docker.sock
```

chown recursive
-----
```sh
chown ${USER}:${USER} ${HOME}/work/opt/tomcat -R
```


