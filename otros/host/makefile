VERSION_FRONT := 0.9.0
VERSION_JAIME := 0.12.0
VERSION_AGENT := 0.11.0


jaime j:
	docker run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/root/.jaime \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=5000 \
		brianwolf94/jaime:$(VERSION_JAIME)


agent1 a1:
	docker run --rm -d \
		--name=agent1 \
		--hostname=agent1 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7000 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)

		
agent2 a2:
	docker run --rm -d \
		--name=agent2 \
		--hostname=agent2 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7001 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		

front f:
	docker run --rm -d \
		--name=front \
		--hostname=front \
		--network=host \
		brianwolf94/jaime-front:$(VERSION_FRONT)

dozzle d:
	docker run --rm -d \
		--name=dozzle \
		--hostname=dozzle \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--network=host \
		amir20/dozzle


filebrowser fb:
	docker run --rm -d \
		--name=filebrowser \
		--hostname=filebrowser \
		-v shared:/data:rw \
		-v shared:/config:rw \
		-p 9090:8080 \
		hurlenko/filebrowser

kill k:
	docker kill jaime agent1 agent2 front dozzle filebrowser
	
run r: d j a1 a2 f fb
