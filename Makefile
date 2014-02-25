IMAGE=joaodubas/staticserver:0.0.1
MOUNT=-v `pwd`:/app
PORT=-p 8900:3000
ARGS=-rm -i -t $(MOUNT) $(PORT)

NPM_CMD=docker run $(ARGS) $(IMAGE)
NODE_CMD=docker run $(ARGS) -entrypoint node $(IMAGE)

build:
	docker build -rm -t $(IMAGE) .

install:
	$(NPM_CMD) install

run:
	$(NPM_CMD)

repl:
	$(NODE_CMD) --harmony

.PHONY: run repl
