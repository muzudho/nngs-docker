# Run NNGS on Docker

## Start

Windows 以外でも使えると思いますが、 Windows での書き方で説明します。  

* [ ] Docker を起動しておいてください。

```shell
# Option.
set COMPOSE_PROJECT_NAME=nngs

# +
# | # ↓ なくても動くみたいだから、一旦コメントアウトするぜ（＾～＾）
# | # Please rewrite it in your git hub account.
# | # mlrateを Git hub からダウンロードしてくるために使うぜ☆（＾～＾）
# | set NNGS_GIT_USER_NAME=yourname
# | set NNGS_GIT_USER_EMAIL=yourname@example.com
# +

# Run
docker-compose up -d --build
# After the second time
# docker-compose up -d
```

Option:  

```shell
# If you look at the log.
docker-compose logs -f

# Enter a docker container.
docker exec -it nngs_nngs_1 bash
```

## Stop

```shell
docker-compose down
```
