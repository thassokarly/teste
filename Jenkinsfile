pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'playwright-tests'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/thassokarly/test'
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    // Build do container que roda Playwright
                    sh 'docker build -t $DOCKER_IMAGE ./playwright'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Executa os testes dentro do container
                    sh 'docker run --rm $DOCKER_IMAGE'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finalizado'
        }
    }
}
