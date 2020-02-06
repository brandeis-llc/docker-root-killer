# docker-root-killer 

A simple bash script to check running docker containers and kill containers that run stuff as root inside, and its accompanying systemd service file. 

## requirement 

* bash 
* systemd

Basically, any modern linux system. 

## installation 

Copy `.sh` file to `/usr/local/bin`, and make sure it's executable by user. Then add `.service` file as a service managed by `systemd`.
```
sudo systemctl enable `pwd`/*.service`  # adding as a service (creating symlink)
sudo systemctl start docker-root-killer
```
