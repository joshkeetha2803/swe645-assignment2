// Purpose: Jenkins CI/CD Pipeline configuration for automated build and K8s deployment.
// Team Members: Joshitha Keetha & Bhuvitha Tummala
// COurse : SWE_645

pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'jkeetha28/swe645-survey-app:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/joshkeetha2803/swe645-assignment2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker push $DOCKER_IMAGE'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                    sh 'kubectl apply -f k8s/service.yaml'
                    sh 'kubectl rollout restart deployment/swe645-survey-app'
                }
            }
        }
    }
}   