This is the bare base Docker image for all Nitrous.IO ubuntu containers. The difference between this image and nitrous-io/ubuntu is that this one does not preinstall useful packages like git, tmux, zsh etc.

To run:

```
docker build -t nitrousio/ubuntu-bare:trusty .
docker run -i -t -d nitrousio/ubuntu-bare:trusty
docker logs <CID>
docker ps <CID>
ssh -p <port> action@<ip>
```

Enter the password `docker logs` command displays.
