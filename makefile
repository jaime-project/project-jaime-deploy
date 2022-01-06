VERSION_FRONT := 0.8.0
VERSION_JAIME := 0.10.0
VERSION_AGENT := 0.10.0


jaime j:
	docker run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/root/.jaime \
		-p 5000:80 \
		--network=docker-net \
		brianwolf94/jaime:$(VERSION_JAIME)


agent1 a1:
	docker run --rm -d \
		--name=agent1 \
		--hostname=agent1 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		-p 7000:80 \
		--network=docker-net \
		-e JAIME_URL=http://jaime:80 \
		-e RUN_ON_DOCKER=true \
		brianwolf94/jaime-agent:$(VERSION_AGENT)


agent2 a2:
	docker run --rm -d \
		--name=agent2 \
		--hostname=agent2 \
		-v jaime-agent:/root/.jaime-agent \
		-v shared:/data:rw \
		-p 7001:80 \
		--network=docker-net \
		-e JAIME_URL=http://jaime:80 \
		-e RUN_ON_DOCKER=true \
		brianwolf94/jaime-agent:$(VERSION_AGENT)

front f:
	docker run --rm -d \
		--name=front \
		--hostname=front \
		-p 4200:80 \
		--network=docker-net \
		brianwolf94/jaime-front:$(VERSION_FRONT)

dozzle d:
	docker run --rm -d \
		--name=dozzle \
		--hostname=dozzle \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-p 8080:8080 \
		--network=docker-net \
		amir20/dozzle

filebrowser fb:
	docker run --rm -d \
		--name=filebrowser \
		--hostname=filebrowser \
		-v shared:/data:rw \
		-v shared:/config:rw \
		-p 9090:8080 \
		--network=docker-net \
		hurlenko/filebrowser

kill k:
	docker kill jaime agent1 agent2 front dozzle filebrowser
	docker network rm docker-net


network n:
	docker network create docker-net
	
run r: n d j a1 a2 f fb
