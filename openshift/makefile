NAMESPACE=jaime


jaime j:
	oc new-project $(NAMESPACE)
	oc project $(NAMESPACE)
	oc apply -f jaime-template.yaml
	oc process jaime \
		-p BACK_HOSTNAME_HTTP=jaime-jaime.apps.cluster-r27z5.r27z5.sandbox1263.opentlc.com \
		-p JAIME_VERSION=1.6.35 \
		| oc create -f -


delete d:
	oc delete project $(NAMESPACE)