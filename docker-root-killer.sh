#! /bin/bash

while true ; do
    for cont in `docker ps -q`; do 
        cont_user=`docker inspect $cont --format '{{.Config.User}}'`
        if [ -z $cont_user ] || [ $cont_user == 'root' ] ; then 
            printf "killed %s (%s) based on %s image.\n" \
                $cont \
                `docker inspect $cont --format {{.Name}}` \
                `docker image inspect $(docker inspect $cont --format {{.Image}}) --format {{.RepoTags}}` \
                | systemd-cat -p warning -t `basename $0`


            docker stop $cont
            docker rm $cont
        fi
    done
    sleep 10
done

