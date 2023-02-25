VERSION := 1.12.0


build b:
	podman build . -t ghcr.io/jaime-project/jaime:$(VERSION) --build-arg ARG_VERSION=$(VERSION)


push p:
	podman push ghcr.io/jaime-project/jaime:$(VERSION)
