# サーバーの開始

Windows 以外でも使えると思いますが、 Windows での書き方で説明します。  

```shell
# Option.
set COMPOSE_PROJECT_NAME=NNGS

# Please rewrite it in your git hub account.
# mlrateを Git hub からダウンロードしてくるために使うぜ☆（＾～＾）
set NNGS_GIT_USER_NAME=yourname
set NNGS_GIT_USER_EMAIL=yourname@example.com

# Run.
docker-compose up -d --build
```

## Option

```shell
# If you look at the log.
docker-compose logs -f

# Enter a docker container.
docker exec -it nngs_nngs_1 bash
```
