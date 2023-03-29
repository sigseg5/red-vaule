# Docker container with cloud browser in which Russian Trusted CA certificates are installed

This repository contains a demhack 6 MVP tech project.

## Task Description

Create a Cloud Browser with government CA certificates
You need to create a cloud browser with RU CA that can be deployed in Russia. The solution will also be relevant also for expatriates and those who need particularly important certificate privacy.

## Usage

- [Install](https://docs.docker.com/engine/install) Docker

- Rent machine in target country

- Run this command from the project folde:

      docker build . -t demhack && \
      docker run -d -p 5901:5901 -p 6901:6901 -e VNC_PW=pass -e VNC_RESOLUTION=1440x794 demhack

See below for more information

- Print out help page:

      docker run demhack --help

- Run build command inside project directory:

      docker build . -t demhack

- Run command with some environment variables and mapping to local port `5901` (classic vnc client access) and `6901` (vnc web client access):

      docker run -d -p 5901:5901 -p 6901:6901 -e VNC_PW=pass -e VNC_RESOLUTION=1440x794 demhack

- You can change the default user and group within a container to your own with adding `--user $(id -u):$(id -g)`:

      docker run --platform=linux/amd64 -d -p 5901:5901 -p 6901:6901 -e VNC_PW=pass -e VNC_RESOLUTION=1440x794 --user $(id -u):$(id -g) demhack

Note: You can also specify the architecture by adding `--platform=linux/amd64` or `--platform=linux/arm64` to build and run commands.

## Connect & Control

If the container is started like mentioned above, connect via one of these options:

- connect via VNC client [`localhost:5901`](localhost:5901) / [`0.0.0.0:6901/`](0.0.0.0:6901/), default password: `hack`
- connect via noVNC HTML5 web client: [`localhost:6901/?password=hack`](http://localhost:6901/?password=hack) / [`0.0.0.0:6901/?password=hack`](http://0.0.0.0:6901/?password=hack)

## Available environment options

### Connection password

Overwrite the value of the environment variable `VNC_PW`. Add this to the docker run command (without parentheses):

    -e VNC_PW=<password> 

### Session resolution resolution

Overwrite the value of the environment variable `VNC_RESOLUTION`. Add this to the docker run command (without parentheses):

    -e VNC_RESOLUTION=<1920x1080>
