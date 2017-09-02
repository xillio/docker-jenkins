# Jenkins in Docker

The default [jenkins docker image](https://hub.docker.com/r/jenkins/jenkins/) has some issues with
running docker agents. This docker image should eleviate that.

## Quickstart

To quickly set up a jenkins container:

```bash
docker run \
  --name jenkins
  -p 8080:8080
  -v <path to data>:/var/jenkins_home
  -v /var/run/docker.sock:/var/run/docker.sock
```

## Parameters

`-p 8080` - http port for web access
`-p 50000` - jnlp port for starting jenkins slaves through jnlp (*optional*)
`-v /var/jenkins_home` - local path for workspaces and jenkins data
`-v /var/run/docker.sock` - expose the docker socket to jenkins

## Dockerhub

You can find more information at: https://hub.docker.com/r/chappio/jenkins/
