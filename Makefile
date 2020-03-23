VERSION ?= 1.0.0
PORT ?= 8080
REPO ?= private

.PHONY: build-package
build-package: 
	docker build -f dist.Dockerfile -t ${REPO}/myapp:${VERSION} .


.PHONY: run-package
run-package: 
	docker run -it -p ${PORT}:8080 ${REPO}/myapp:${VERSION}

.PHONY: run-tests
run-tests: 
	./run-accepptance-tests.sh 

.PHONY: publish
publish: 
	./scripts/publish.sh ${VERSION}

.PHONY: minikube
minikube:
	./scripts/minikube_launch.sh

.PHONY: registry
registry:
	./scripts/registry.sh