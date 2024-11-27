
pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-node-app'
        DOCKER_TAG = 'latest'
        PORT = '8084'
        APP_PORT = '3000'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/shiv4j/week5.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'npm test'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p ${PORT}:${APP_PORT} ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying to production...'
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    sh 'docker stop $(docker ps -q --filter ancestor=${DOCKER_IMAGE}:${DOCKER_TAG})'
                    sh 'docker rm $(docker ps -a -q --filter ancestor=${DOCKER_IMAGE}:${DOCKER_TAG})'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace.'
            cleanWs()
        }

        success {
            echo 'Build and Deployment succeeded.'
        }

        failure {
            echo 'Build or Deployment failed.'
        }
    }
}
