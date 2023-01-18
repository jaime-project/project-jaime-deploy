VERSION_JAIME := 1.10.0
VERSION_AGENT := 1.10.0


jaime j:
	podman run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/home/jaime/.jaime:rw \
		-v shared:/data:rw \
		-p 5000:5000 \
		-p 8080:8080 \
		--network=jaime-net \
		ghcr.io/jaime-project/jaime:$(VERSION_JAIME)


agent1 a1:
	podman run --rm -d \
		--name=agent1 \
		--hostname=agent1 \
		-v shared:/data:rw \
		-p 7001:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		ghcr.io/jaime-project/jaime-agent-kubernetes:$(VERSION_AGENT)


agent2 a2:
	podman run --rm -d \
		--name=agent2 \
		--hostname=agent2 \
		-v shared:/data:rw \
		-p 7002:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		ghcr.io/jaime-project/jaime-agent-openshift:$(VERSION_AGENT)
		
		
agent3 a3:
	podman run --rm -d \
		--name=agent3 \
		--hostname=agent3 \
		-v shared:/data:rw \
		-p 7003:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		ghcr.io/jaime-project/jaime-agent-kubernetes:$(VERSION_AGENT)
		

agent4 a4:
	podman run --rm -d \
		--name=agent4 \
		--hostname=agent4 \
		-v shared:/data:rw \
		-p 7004:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		ghcr.io/jaime-project/jaime-agent-pushgateway:$(VERSION_AGENT)


kill k:
	podman kill jaime agent1 agent2 agent3 agent4
	podman network rm jaime-net

	
network n:
	podman network create jaime-net
	
	
run r: n j a1 a2 a3 a4


clean c:
	podman network rm jaime-net

	
