.PHONY: run chmod

run: init chmod
	docker compose run --rm gcloud bash

init:
	@if [ ! -f .env ]; then \
		cp .env.sample .env; \
	fi

chmod:
	chmod 755 ./bin/*
