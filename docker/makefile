VERSION_FRONT := 1.6.0
VERSION_JAIME := 1.6.0
VERSION_AGENT := 1.6.0


jaime j:
	docker run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/root/.jaime \
		-v shared:/data:rw \
		-p 5000:5000 \
		--network=jaime-net \
		brianwolf94/jaime:$(VERSION_JAIME)


agent1 a1:
	docker run --rm -d \
		--name=agent1 \
		--hostname=agent1 \
		-v shared:/data:rw \
		-p 7001:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		brianwolf94/jaime-agent-kubernetes:$(VERSION_AGENT)


agent2 a2:
	docker run --rm -d \
		--name=agent2 \
		--hostname=agent2 \
		-v shared:/data:rw \
		-p 7002:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		brianwolf94/jaime-agent-openshift:$(VERSION_AGENT)
		
		
agent3 a3:
	docker run --rm -d \
		--name=agent3 \
		--hostname=agent3 \
		-v shared:/data:rw \
		-p 7003:7001 \
		-e JAIME_URL=http://jaime:5000 \
		--network=jaime-net \
		brianwolf94/jaime-agent:$(VERSION_AGENT)

front f:
	docker run --rm -d \
		--name=front \
		--hostname=front \
		-p 4200:80 \
		-e JAIME_URL=http://localhost:5000 \
		--network=jaime-net \
		brianwolf94/jaime-front:$(VERSION_FRONT)

dozzle d:
	docker run --rm -d \
		--name=dozzle \
		--hostname=dozzle \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-p 8081:8080 \
		--network=jaime-net \
		amir20/dozzle

filebrowser fb:
	docker run --rm -d \
		--name=filebrowser \
		--hostname=filebrowser \
		-v shared:/data:rw \
		-v shared:/config:rw \
		-p 8080:8080 \
		--network=jaime-net \
		hurlenko/filebrowser

		
kill k:
	docker kill jaime agent1 agent2 agent3 front dozzle filebrowser
	docker network rm jaime-net

	
network n:
	docker network create jaime-net
	
	
run r: n j a1 a2 a3 f fb d


clean c:
	docker network rm jaime-net

	
