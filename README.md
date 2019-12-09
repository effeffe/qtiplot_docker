# qtiplot_docker
##LICENSE

¢Filippo Falezza

All the text written has been released under GPLv3, unless otherwise explicitly stated. All the packages and software the scripts may download, execute, modify or whatever is released under their own licenses and owned by their respective proprietors.

## INFO
This is a repository to allow the installation of qtiplot on systems where pre-built packages are not available or compiling is very messy if not impossible.
This docker file is based in a debian buster image from docker, allowing X11 forwarding as well.

## INSTALLING
To install, just build the dockerfile above, as:

`$ cd qtiplot_docker`

`$ docker build -t qtiplot_debian .`

## INITIAL SETUP AND CONFIGURATION
After building everything, we need to allow a couple of things.
First of all, we need to allow local X11 connections, as follows:

`$ xhost +local:docker`

The execute this on the first run

`$ docker run -it --env=DISPLAY --env=QT_X11_NO_MITSHM=1 --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro --volume=/etc/sudoers.d:/etc/sudoers.d:ro --workdir="/home/$USER" --volume="/home/$USER:/home/$USER" qtiplot_debian`

If everything works, QtiPlot should show. You can now close the application. TO avoid multiple containers, blease do not execute the line above twice or more.
Now, Disallow the X11 local connections (for security):

`$ xhost -local:docker`

And to start the docker image a second time, start the exited container, of which the name can be found as follows:

`$ docker container ls --all`


This should give back a name, which needs to be substituted to `CONTAINER_NAME` in the QtiPlot.sh script in this repository.
Please, add execution permissions to the script on your system if not present.
