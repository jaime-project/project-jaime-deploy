VERSION_FRONT := 1.9.0
VERSION_JAIME := 1.9.0
VERSION_AGENT := 1.9.0


jaime j:
	podman run --rm -d \
		--name=jaime \
		--hostname=localhost \
		-v jaime:/home/jaime/.jaime \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=5000 \
		ghcr.io/jaime-project/jaime:$(VERSION_JAIME)


agent1 a1:
	podman run --rm -d \
		--name=agent1 \
		--hostname=localhost \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7001 \
		-e JAIME_URL=http://localhost:5000 \
		-e RUN_ON_podman=false \
		ghcr.io/jaime-project/jaime-agent:$(VERSION_AGENT)
		
		
agent2 a2:
	podman run --rm -d \
		--name=agent2 \
		--hostname=localhost \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7002 \
		-e JAIME_URL=http://localhost:5000 \
		ghcr.io/jaime-project/jaime-agent-openshift:$(VERSION_AGENT)
		
		
		
agent3 a3:
	podman run --rm -d \
		--name=agent3 \
		--hostname=localhost \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7003 \
		-e JAIME_URL=http://localhost:5000 \
		ghcr.io/jaime-project/jaime-agent-kubernetes:$(VERSION_AGENT)
		
		
		
agent4 a4:
	podman run --rm -d \
		--name=agent4 \
		--hostname=localhost \
		-v shared:/data:rw \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7004 \
		-e JAIME_URL=http://localhost:5000 \
		ghcr.io/jaime-project/jaime-agent-pushgateway:$(VERSION_AGENT)
		

front f:
	podman run --rm -d \
		--name=front \
		--network=host \
		-e JAIME_URL=http://0.0.0.0:5000 \
		ghcr.io/jaime-project/jaime-front:$(VERSION_FRONT)


kill k:
	podman kill jaime agent1 agent2 agent3 agent4 front 
	
	
run r: j a1 a2 a3 a4 f 
