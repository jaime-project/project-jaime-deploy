VERSION_FRONT := 0.2.0
VERSION_JAIME := 0.7.0
VERSION_AGENT := 0.7.0


jaime j:
	docker run --rm -d \
		--name=jaime \
		--hostname=jaime \
		-v jaime:/root/.jaime \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=5000 \
		brianwolf94/jaime:$(VERSION_JAIME)


agent1 a1:
	docker run --rm -d \
		--name=agent1 \
		--hostname=agent1 \
		-v jaime-agent:/root/.jaime-agent \
		--network=host \
		-e PYTHON_HOST=localhost \
		-e PYTHON_PORT=7000 \
		-e JAIME_URL=http://localhost:5000 \
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


kill k:
	docker kill jaime front dozzle agent1


run r: d j f a1
