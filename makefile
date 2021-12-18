VERSION_FRONT := 0.3.0
VERSION_JAIME := 0.9.0
VERSION_AGENT := 0.9.0


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
		-p 7000:80 \
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


logs-jaime lj:
	docker logs -f jaime


logs-agent la1:
	docker logs -f agent


kill k:
	docker kill jaime agent1 front dozzle
	docker network rm docker-net


network n:
	docker network create docker-net
	
run r: n d j a1 f
