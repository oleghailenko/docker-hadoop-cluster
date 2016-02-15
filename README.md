# Multi host hadoop cluster based on Docker containers.

## Prerequirements

1. Docker should be [installed](https://docs.docker.com/engine/installation/linux/ubuntulinux/) on each host.
2. [Docker daemon](https://docs.docker.com/engine/reference/commandline/daemon/) should be run in tcp mode.
3. Each host should be able to recognize each other by hostname. Simplest way to do this - use /etc/hosts

## Installation
1. Specify host names of the master and slave nodes in files `masters` and `nodes` respectively.
2. Run script `set-up-env.sh` for download all dependencies.
3. Run script `build.sh` for build Docker images.
4. Run script `start.sh` for start cluster.
5. Run `stop.sh` for stop cluster.