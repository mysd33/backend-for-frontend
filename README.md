* ローカルでDockerビルド
```sh
docker build -t 523530166249.dkr.ecr.ap-northeast-1.amazonaws.com/mynavi-sample-ecs-bff:latest .
```

* ローカルでDocker実行（ProfileをdevでSpringBoot実行）
```sh
docker run -d -p 8081:8081 --name samplebff --env ENV_TYPE=dev --add-host=localhost:(ローカルPCのプライベートIP) 523530166249.dkr.ecr.ap-northeast-1.amazonaws.com/mynavi-sample-ecs-bff:latest
```