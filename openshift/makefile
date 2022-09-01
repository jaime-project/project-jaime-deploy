NAMESPACE=jaime


jaime j:
	oc new-project $(NAMESPACE)
	oc project $(NAMESPACE)
	oc apply -f jaime-template.yaml
	oc process jaime \
		-p BACK_HOSTNAME_HTTP=jaime-jaime.apps.cluster-nrh9d.nrh9d.sandbox1367.opentlc.com \
		-p JAIME_VERSION=1.7.1 \
		| oc create -f -


delete d:
	oc delete project $(NAMESPACE)
