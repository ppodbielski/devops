pipeline {

  agent {
    label "java-app"
  }

  parameters {
    string(name: 'VERSION', defaultValue: "1.0.0", description: 'app version')
  }

  stages {
    stage("Checkout") {
      steps {
        checkout scm: [$class: 'GitSCM',
        branches: [[name: '*/master']], 
        userRemoteConfigs: [[url: 'https://github.com/ppodbielski/devops.git']]]
      }
    }

    stage("Bild") {
      steps {
        sh 'VERSION=${VERSION} make build-package'
      }
    }

    stage("Acceptance test") {
      steps {
        sh 'VERSION=${VERSION} PORT=${PORT} make run-package'
        sh 'make run-tests'
      }
    }

    stage("Publish") {
      steps {
        sh 'VERSION=${VERSION} make publish'
      }
    }

    stage("Deploy") {
      steps {
        sh 'make minikube'
        // sh 'eval $(minikube -p minikube docker-env)'
        sh '''kubectl apply -f k8s/configmap.yaml \
            -f k8s/service.yaml \
            -f k8s/deployment.yaml '''
      }
    }
  }
}
