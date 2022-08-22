jaime j:
	oc new-project jaime
	oc apply -n jaime -f jaime-template.yaml
	oc process jaime -n jaime \
		-p BACK_HOSTNAME_HTTP=jaime-jaime.apps.cluster-r27z5.r27z5.sandbox1263.opentlc.com \
		-p JAIME_VERSION=1.6.35 \
		| oc create -n jaime -f -


delete d:
	oc delete project jaime