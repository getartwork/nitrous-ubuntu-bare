This is the bare base Docker image for all Nitrous.IO ubuntu containers. The difference between this image and nitrous-io/ubuntu is that this one does not preinstall useful packages like git, tmux, zsh etc.

To run:

```
docker build -t nitrousio/ubuntu-bare:latest .
docker run -i -t -d nitrousio/ubuntu-bare:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> nitrous@<ip>
```

Enter the password `docker logs` command displays.
