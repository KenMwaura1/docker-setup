# docker-setup

This repo holds the config files and commands to spin up development containers for my personal setup.

[![Script Test CI](https://github.com/KenMwaura1/docker-setup/actions/workflows/script-test.yml/badge.svg)](https://github.com/KenMwaura1/docker-setup/actions/workflows/script-test.yml) 
[![Docker Image CI](https://github.com/KenMwaura1/docker-setup/actions/workflows/docker-image.yml/badge.svg)](https://github.com/KenMwaura1/docker-setup/actions/workflows/docker-image.yml)

**Note**: This is a work in progress. I will be adding more containers as I go along. Feel free to contribute!

## Table of Contents

### Prerequisites

- [Docker](https://docs.docker.com/install/linux/docker-ce/)
- [git](https://git-scm.com/downloads)
- [Github](https://github.com)
- updated [docker-compose](https://docs.docker.com/compose/install/)
- [make](https://www.gnu.org/software/make/)

## Running the containers

The shell scripsts have been verified and tested on arch linux. They should work on other linux distros as well.

Windows users can use [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) to run the scripts.

Optionally, on windows you can use [Docker Desktop](https://www.docker.com/products/docker-desktop) to run the containers. This is the easiest way to get started. Copy paste the commands in the scripts into the terminal.

First clone the repo and cd into the directory

```bash
git clone https://github.com/KenMwaura1/docker-setup
cd docker-setup
```

make sure you have the latest version of docker-compose.
follow the instructions [here](https://docs.docker.com/compose/install/) to install it.
For arch linux users, run the following command:

```bash
sudo pacman -S docker-compose
```

The shell scripts in the root directory are used to spin up the containers. The scripts are named after the service they spin up. For example, to spin up the mongo container, run the following command:

```bash  
./mongo.sh
```

Ensure the script is executable by running the following command:

```bash
chmod +x mongo.sh
```

## MongoDB Compass

## Usage

### Build

Run the following command to build the docker image for the mongo compass container. This will take a while the first time you run it.

```bash
make build
```

### Run

To bring up X-11 Desktop of Mongodb-Compass:

Cd into the mongo-compass-docker directory and run the following command:

```bash
./run.sh
```

## Postgres & pgAdmin

Cd into the `postgres-pgadmin` directory and run the following command to build the docker images for the postgres & pgadmin then start the containers:

```bash
./postgres.sh
```

To use pgAdmin, open a browser and navigate to `localhost:5050`. The default login credentials are:

```bash
email: hippo
password: datalake
```

To use postgres, open a browser and navigate to `localhost:5432`. The default login credentials are:

```bash
email: postgres
password: datalake
```

To use your own custom credentials for postgres, edit the `pg-env.list` file in the `postgres-pgadmin` directory.

To use your own custom credentials for pgAdmin, edit the `pgadmin-env.list` file in the `postgres-pgadmin` directory.

## Redis

Cd into the `redis` directory and run the following command to build the docker image for the redis container then start the container:

```bash
./redis.sh
```

## RUN ALL CONTAINERS ---> **Not Recommended!**

In the root directory, run the following command to spin up all the containers:

```bash
./all.sh
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
