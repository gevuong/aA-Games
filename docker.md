# Kubernetes 

## Why Kubernetes 

- 


# Docker

## Why use Docker

- Docker makes it really easy to install and run software without worrying about setup or dependencies.

## What is Docker

- Docker is a platform or ecosystem around creating and running containers.
- When someone mentions Docker, it can mean multiple products in the Docker ecosystem (i.e. Docker Client, Docker Server, Docker Machine, Docker Images, Docker Hub, Docker Compose).
- Docker Client (Docker CLI) is a tool that we use to issue commands. It doesn't do anything with containers or images. It's more of a portal to interact with other tools, like Docker Server (Daemon).
- Docker Server (Docker Daemon) is a tool that's responsible for creating and uploading images, running and maintaining containers, etc. It runs behind the scenes.

- When a docker command is run (i.e. `docker run -it redis`), the Docker Client contacted Docker daemon, and Docker daemon checks locally in the image cache to see if the image has been downloaded before. If not, daemon pulls the redis Docker image from Docker Hub. The Docker daemon created a container from that image which ran the executable that produces the output.

- A docker image is a single file containing all the deps and config required to run a program. The image can be used to create a container. An image is a snapshot of the file system and the startup command as well.

- A container is an instance of an image, or a program with its own isolated hardware set of resources.

## What is a Container

- Well, how does your OS run on your computer?

Processes that run on your computer (i.e. Chrome, Spotify, Terminal) makes a "system call", which are requests to kernel to interact with a piece of hardware. The kernel then communicates to hardware (i.e. CPU, memory, hard disk).

- By namespacing, you can isolate resources per process (or group of processes). So if a program wants to access HD and requires Python v2 and another requires Python v3, then with namespacing your HD, the process that requires Python v2 will access a specific namespace in that HD.

- Then a control group is used to limit amount of resources used per process (i.e. memory, CPU usage, HD I/O, network bandwidth).

- A container is a process or set of processes that have grouping of resources specifically assigned to it, like the Python v2 or Python v3 example.

- FYI, namespacing and control groups are limited to Linux OS, not Windows or Mac. When installing Docker, you also installed Linux VM on your computer. Inside the VM is where all the containers are going to be created, and is where the Linux kernel will be hosting running processes inside of containers.


## Docker commands 

- `docker run busybox ls`
- `docker run busybox ping google.com`
- `docker run ps` - shows list of running containers
- `docker ps --all` shows list of all containers that we have ever created
- ps commands are important to obtain the ID of a specific container so we can run commands on that specific container.

- `docker run` is equal to running two commands = `docker create` which takes or sets up the file system snapshot from image to create a container + `docker start` which runs the startup command to start a container.

### Container Lifecycle
- `docker create hello-world` returns the ID of the container created for hello-world.
- `docker start -a <insert container ID>` to execute the primary startup command for hello-world. The `-a` is what's going to make Docker actually watch for output from the container and print it out to your terminal. Without `-a`, `docker start` will not show you output printed in the terminal.

- `docker system prune` will delete all stopped containers, downloaded images in cache. Then running `docker ps --all` will show an empty list of past created containers.

- `docker logs <insert container ID>` will print all logs from starting the container. Running this command will not rerun or restart the container in any form.

- To stop a running container: cmd + C, `docker stop `, or `docker kill <container id>`. But what's the difference?
- `docker stop <container id>` sends a SIGTERM message, which is short for terminate signal, that's going to be received by the running process to stop a process inside of your container and shut down the container on its own time. This is so the process can do a bit of cleanup before shutdown, or save some file, or emit some error message before shut down, etc. 
- `docker kill <container id>` issues a SIGKILL message, or kill signal, to the primary running process, which means process has to shut down right now without doing any additional cleanup or work. 
- Ideally, we want to stop a container with the `docker stop <container id>` command. If container is locked up, then issue `docker kill <container id>` instead. After 10 seconds, `docker stop <container id>` falls back to `docker kill <container id>`.

