pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'playwright-tests'  // Nome da imagem Docker para os testes
    }

    stages {
        stage('Checkout') {
            steps {
                // Clona o repositório usando a credencial segura do GitHub
            git branch: 'main', url: 'https://github.com/thassokarly/teste', credentialsId: 'git'

            }
        }

        stage('Build Docker') {
            steps {
                script {
                    // Constrói a imagem Docker do Playwright
                    sh 'docker build -t $DOCKER_IMAGE ./playwright'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Executa os testes dentro do container Docker
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
