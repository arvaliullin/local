# Local Docker Registry

Локальный registry из `docker-compose.yml` доступен на `localhost:3003`.
Эти команды подтягивают образы, используемые compose-файлом, ставят им локальные теги и пушат их в этот registry.

## Запуск registry

```sh
docker compose up -d registry
```

## Pull образов из `docker-compose.yml`

```sh
docker pull docker.gitea.com/gitea:1.26.4
docker pull registry:3.1.1
docker pull gomods/athens:v0.18.0
```

## Теги для локального registry

```sh
docker tag docker.gitea.com/gitea:1.26.4 localhost:3003/gitea:1.26.4
docker tag registry:3.1.1 localhost:3003/registry:3.1.1
docker tag gomods/athens:v0.18.0 localhost:3003/athens:v0.18.0
```

## Push в локальный registry

```sh
docker push localhost:3003/gitea:1.26.4
docker push localhost:3003/registry:3.1.1
docker push localhost:3003/athens:v0.18.0
```

## Проверка

```sh
curl http://localhost:3003/v2/_catalog
curl http://localhost:3003/v2/gitea/tags/list
curl http://localhost:3003/v2/registry/tags/list
curl http://localhost:3003/v2/athens/tags/list
```

`localhost` можно использовать без настройки insecure registry. Если обращаться к registry с другой машины по IP или DNS имени через HTTP, Docker daemon на клиенте нужно настроить как insecure registry для этого адреса.
