NAMESPACE=jaime


install i:
	oc new-project $(NAMESPACE)
	oc project $(NAMESPACE)
	oc apply -f jaime-template.yaml
	oc process jaime \
		-p BACK_HOSTNAME_HTTP=jaime-jaime.apps.cloudbajos.gde.gob.ar \
		-p JAIME_VERSION=1.9.0 \
		| oc create -f -


delete d:
	oc delete project $(NAMESPACE)
