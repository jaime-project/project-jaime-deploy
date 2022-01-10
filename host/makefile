VERSION_FRONT := 0.9.0
VERSION_JAIME := 0.12.0
VERSION_AGENT := 0.11.0


jaime j:
	docker run --rm -d \
		--name=jaime \
		-v jaime:/root/.jaime \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=5000 \
		brianwolf94/jaime:$(VERSION_JAIME)


agent1 a1:
	docker run --rm -d \
		--name=agent1 \
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
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7001 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		

		
agent3 a3:
	docker run --rm -d \
		--name=agent3 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7002 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		
		
		
agent4 a4:
	docker run --rm -d \
		--name=agent4 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7003 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		
		
		
agent5 a5:
	docker run --rm -d \
		--name=agent5 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7004 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		
		
		
agent6 a6:
	docker run --rm -d \
		--name=agent6 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7005 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_DOCKER=false \
		brianwolf94/jaime-agent:$(VERSION_AGENT)
		

front f:
	docker run --rm -d \
		--name=front \
		--network=host \
		brianwolf94/jaime-front:$(VERSION_FRONT)


filebrowser fb:
	docker run --rm -d \
		--name=filebrowser \
		-v shared:/data:rw \
		-v shared:/config:rw \
		--network=host \
		hurlenko/filebrowser

kill k:
	docker kill jaime agent1 agent2 agent3 agent4 agent5 agent6 front filebrowser
	
run r: j a1 a2 a3 a4 a5 a6 f fb 
