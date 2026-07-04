.PHONY: init
init:
	mkdir -p storage/gitea storage/registry storage/athens

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down

.PHONY: ps
ps:
	docker compose ps
