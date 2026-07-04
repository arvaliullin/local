# Athens Go Module Proxy

Athens доступен на `http://localhost:3001`.

## Настройка Go

```sh
go env -w GOPROXY="http://localhost:3001,direct"
```

После этого `go mod download`, `go mod tidy` и сборка будут ходить через локальный Athens.

Для офлайн-режима также отключи проверку checksum через публичный sumdb:

```sh
go env -w GOSUMDB=off
```

## Проверка

```sh
go env GOPROXY
curl -I http://localhost:3001/
```

## Офлайн-режим

Athens кеширует скачанные модули в `storage/athens`.
Чтобы работать без интернета:

1. При наличии сети выполни `go mod download` для нужных проектов через Athens.
2. Сохрани каталог `storage/athens` вместе с проектом.
3. На другой машине подними сервисы через `make up` и используй тот же `GOPROXY`.
