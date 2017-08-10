Fuse commands
=====

Fuse start/stop scripts
-----
```sh
./fuse_start_debug.sh
./fuse_stop.sh $COMPANY_NAME $PROJECT_NAME
```

Run dockers
-----
```sh
#docker start postgres
docker run --name postgres -v ~/work/opt/$PROJECT_NAME/postgresql/pgdata:/var/lib/postgresql/data -v ~/work/opt/$PROJECT_NAME/postgresql/tmp:/tmp -p 8432:5432 -d vadjee/postgres
docker run --rm --name office -p 127.0.0.1:8100:8100 -d vadjee/libreoffice
docker run -it --rm --name pops -v ~/work/opt/apache-tomcat-7/conf/local_$PROJECT_NAME-operational.properties:/opt/tomcat/conf/$PROJECT_NAME-operational.properties -v ~/work/opt/$PROJECT_NAME/tomcat/webapps:/opt/tomcat/webapps/ --net=host vadjee/tomcat
docker run -it --rm --name jboss-fuse -p 13000:13000 -p 8080:8080 -p 8181:8181 -v ~/work/opt/$PROJECT_NAME/configs/com.$COMPANY_NAME.$PROJECT_NAME.cfg:/opt/fuse/etc/com.$COMPANY_NAME.$PROJECT_NAME.cfg -v ~/work/opt/$PROJECT_NAME/fs-repo:/opt/fuse/fs-repo -v ~/work/opt/$PROJECT_NAME/temp:/tmp/$PROJECT_NAME -v $HOME/.m2:/home/vadim/.m2 -e FUSE_USER=fuse -e FUSE_PASS=fuse --net=host vadjee/jboss-fuse /opt/fuse/bin/fuse debug
```

Fuse commands
-----
```sh
JBossFuse:karaf@root> $PROJECT_NAME:install
JBossFuse:karaf@root> list | grep $PROJECT_NAME
```
