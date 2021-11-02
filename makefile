
jaime j:
	docker run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/root/.jaime \
		-p 5000:80 \
		--network=docker-net \
		brianwolf94/jaime:0.1.1


agent a:
	docker run --rm -d \
		--name=agent \
		--hostname=agent \
		-v jaime-agent:/root/.jaime-agent \
		-p 7000:80 \
		--network=docker-net \
		-e JAIME_URL=http://jaime:80 \
		-e RUN_ON_DOCKER=true \
		brianwolf94/jaime-agent:0.1.1


logs-jaime lj:
	docker logs -f jaime


logs-agent la:
	docker logs -f agent


kill k:
	docker kill jaime agent
	docker network rm docker-net


network n:
	docker network create docker-net
	
run r: n j a 
