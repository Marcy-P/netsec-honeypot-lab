# netsec-honeypot-lab

## Requirements
### Host setup

* [Docker Engine](https://docs.docker.com/install/) version **17.05** or newer
* [Docker Compose](https://docs.docker.com/compose/install/) version **1.20.0** or newer
* 1.5 GB of RAM
* At least 20 GB of disk

## Usage

### Building the image
```console
$ docker-compose build
```
### Bringing up the network

```console
$ docker-compose up
```
or to hide the execution logs (detached mode):
```console
$ docker-compose up -d
```

### Bringing down the network
If you run the command without the flag -d just press: <kbd>CTRL</kbd>+<kbd>C</kbd>
Otherwise:
```console
$ docker-compose down
```
### Cleanup
Elasticsearch data is persisted inside a volume by default.

In order to entirely shutdown the stack and remove all persisted data, use the following Docker Compose command:
```console
$ docker-compose down -v
```

## Accessing the lab components:
### Kibana
After bringing up the network wait a minute for the kibana setup process. After that to access the Kibana dashboard open the browser and go to [http://localhost:5601](http://localhost:5601). The login credential are the default one: (NB: to change)
* user: elastic
* password: changeme

### Cowrie
To access the Cowrie docker instance type:
```console
$ docker exec -it cowrie /bin/bash
```
To start up cowrie type:
```console
$ cowrie start
```
### Honeydocserver
The network contain a simple Nginx HTTP server used to create log for the honeydocs.
You can access it on the browser by typing: [http://localhost:8080](http://localhost:8080)

### Attacker
You can access the "attacker" instance with the command:
```console
$ docker exec -it attacker /bin/bash
```

## References:

* The dockerfiles used in this project to run ELK stack were pulled from: [Docker-elk](https://github.com/deviantony/docker-elk)
* The cowrie instances uses the official Docker image. More detail configurations in the [Cowrie Docker Repository](https://github.com/cowrie/docker-cowrie)
