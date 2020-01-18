# ssh-port-forward

This docker image allow you to forward any port you like in a network of your computer/server that in the secured network to any public machine that have ssh server installed.

To use it, you can use this stack yaml configuration. Just change the environment variable to connect to your machine.

stack.yml
```yaml
version: "3.7"

services:
  forward:
    image: nocturlab/ssh-port-forward:latest
    networks:
      - host
    environment:
      SSH_KEY: |
        -----BEGIN OPENSSH PRIVATE KEY-----
        [...]
        -----END OPENSSH PRIVATE KEY-----
      REMOTE_USER: user
      REMOTE_HOST: example.com
      SSH_PORT: 22
      PORT: localhost:22
      REMOTE_PORT: 0.0.0.0:2222
    deploy:
      replicas: 1

networks:
  host:
    external: true
```
