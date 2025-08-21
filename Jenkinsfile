pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'playwright-tests'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/thassokarly/test.git', 
                    credentialsId: 'git'
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE ./playwright'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'docker run --rm $DOCKER_IMAGE'
            }
        }
    }
}
