# 本机子，想要纯环境

## SSH 环境

```shell
docker build -t ssh-image:latest .

```

run

```shell
docker run -id -p 4422:22 -p 4480:80 --name ssh ssh-image:latest
```

connect

```shell
ssh root@127.0.0.1 -p 4422
```
