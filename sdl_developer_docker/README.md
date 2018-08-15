# Basic developer docker image : `developer_docker`

## Desciption : 
To avoid problems with access to local files in mounted directories
this docker image create inside docker container user `developer`.`

UID of `developer` will be the same as UID of local user.

## Dependencies :
 - make
 - docker
 
## Usage :
### Automated build :

Inside `developer_docker` folder:

```
$ make 
```

### Manual build :

```
$ docker build -t developer_docker .
```

### Automated run

```
$ make run
```
This command will run docker image and run `bash` terminal in it. 
Also it will mount local `~/sdl` directory to `/home/developer/sdl` directory inside docker container.

### Manual run :

```
docker run -it --rm  \
           -e LOCAL_USER_ID=`id -u $USER` -e DISPLAY=$DISPLAY \
	   -e IMAGE_NAME=developer_docker \
           --security-opt seccomp=unconfined \
           developer_docker
```

With option `-v` you can mount local directories inside docker containter.

#### Example (mount local `~/sdl` directory to `/home/developer/sdl` directory inside docker container)

```
docker run -it --rm  \
           -e LOCAL_USER_ID=`id -u $USER` -e DISPLAY=$DISPLAY \
	   -e IMAGE_NAME=developer_docker \
           -v~/sdl:/home/developer/sdl\
           --security-opt seccomp=unconfined \
           developer_docker
```

