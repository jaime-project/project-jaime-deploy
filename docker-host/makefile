VERSION_FRONT := 1.4.0
VERSION_JAIME := 1.4.0
VERSION_AGENT := 1.4.0


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
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7001 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		
		
agent2 a2:
	docker run --rm -d \
		--name=agent2 \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7002 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		

front f:
	docker run --rm -d \
		--name=front \
		--network=host \
		-e JAIME_URL=http://0.0.0.0:5000 \
		brianwolf94/jaime-front:$(VERSION_FRONT)


filebrowser fb:
	docker run --rm -d \
		--name=filebrowser \
		-v shared:/data:rw \
		-v shared:/config:rw \
		--network=host \
		hurlenko/filebrowser

				
kill k:
	docker kill jaime agent1 agent2 front filebrowser
	
	
run r: j a1 a2 f fb 
