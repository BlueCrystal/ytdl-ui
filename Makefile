UID:=`id -u`
GID:=`id -g`

AUTHOR=squizduos
PROJECT=ytdl-ui
TAG=${ARGS:-local}

APP_DIR=ytdl_ui

run:
	pipenv run python -m $(APP_DIR) -c config.json --host localhost --port 5000

test:
	pipenv run python test/test.py

freeze:
	pipenv run pip freeze > $(APP_DIR)/requirements.txt

docker-build:
	docker build -t $(AUTHOR)/$(PROJECT):$(TAG) .

docker-push:
	docker push $(AUTHOR)/$(PROJECT):$(TAG)

docker-run:
	docker run \
		--name $(PROJECT)-$(TAG) \
		-e PGID=$(GID) \
		-e PUID=$(UID) \
		-e PORT=5000 \
		-e CONF_FILE=/etc/ytdl_ui.json \
		-e FLASK_DEBUG=1 \
		-p 5000:5000 \
		-v $(CURDIR)/config.json:/etc/ytdl_ui.json \
		-v $(CURDIR)/data:/app/data \
		-v $(CURDIR)/log:/app/log \
		-v $(CURDIR)/downloads:/app/downloads \
		-v $(CURDIR)/$(PROJECT):/app/$(PROJECT) \
		--rm $(AUTHOR)/$(PROJECT):$(TAG)

