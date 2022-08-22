jaime j:
	oc new-project jaime
	oc apply -n jaime -f jaime-template.yaml
	oc process jaime -n jaime \
		-p BACK_HOSTNAME_HTTP=jaime-jaime.apps.cluster-r27z5.r27z5.sandbox1263.opentlc.com \
		-p FRONT_HOSTNAME_HTTP=jaime-front-jaime.apps.cluster-r27z5.r27z5.sandbox1263.opentlc.com \
		-p JAIME_VERSION=1.6.35 \
		-p JAIME_VOLUME_SIZE=1Gi \
		-p AGENTS_VOLUME_SIZE=5Gi \
		| oc create -n jaime -f -


delete d:
	oc delete project jaime