# nngs-docker

I changed No Name Go Server (NNGS) 1.1.22  to Docker.

## NNGS Original authors

* [Authors](./nngs-1.1.22/AUTHORS)
* [Thanks](./nngs-1.1.22/THANKS)
* Original files
  * [pem.nu / MLRate](http://pem.nu/cms/index.php/freeprogs)
  * [Source forge / No Name Go Server(NNGS)](https://sourceforge.net/projects/nngs/files/nngs/nngs-1.1.22/)
  * Or this /downloads directory.

## Run (Windows)

```shell
# Option.
set COMPOSE_PROJECT_NAME=NNGS

# Please rewrite it in your git hub account.
set NNGS_GIT_USER_NAME=yourname
set NNGS_GIT_USER_EMAIL=yourname@example.com

docker-compose up -d --build
```

### Connect to the NNGS (Windows)

Please use a telnet.  

Install a telnet:  
[WindowsのTelnetクライアントの使い方 (1/2)](https://www.atmarkit.co.jp/ait/articles/0207/06/news002.html)  

```shell
telnet localhost 9696
```

Please localecho on, if it off.  

How to localecho on:  
[telnetコマンドを実行しても何も返ってこない](https://teratail.com/questions/52543)  

```shell
# `Ctrl + ]`
set localecho

# `Enter`
```

## How to use NNGS

Reference:  
[通信対戦について](http://www.computer-go.jp/gifu2005/regulations/communication.html)  
