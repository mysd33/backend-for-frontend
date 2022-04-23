* ローカルでDockerビルド
```sh
docker build -t XXXXXXXXXXXX.dkr.ecr.ap-northeast-1.amazonaws.com/mynavi-sample-ecs-bff:latest .
```

* ローカルでDocker実行（ProfileをdevでSpringBoot実行）
```sh
docker run -d -p 8081:8081 --name samplebff --env ENV_TYPE=dev --env BACKEND_URL=http://localhost:8080 --add-host=localhost:(ローカルPCのプライベートIP) XXXXXXXXXXXX.dkr.ecr.ap-northeast-1.amazonaws.com/mynavi-sample-ecs-bff:latest
```
* ECRプッシュ
```sh
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin XXXXXXXXXXXX.dkr.ecr.ap-northeast-1.amazonaws.com
docker push XXXXXXXXXXXX.dkr.ecr.ap-northeast-1.amazonaws.com/mynavi-sample-ecs-bff:latest
```