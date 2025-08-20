pipeline {
    agent any

    environment {
        IMAGE_NAME = "playwright-allure"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/thassokarly/teste.git'
            }
        }

        stage('Build Docker') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Tests') {
            steps {
                sh "docker run --rm -v ${WORKSPACE}/allure-results:/app/allure-results -v ${WORKSPACE}/allure-report:/app/allure-report ${IMAGE_NAME}"
            }
        }

        stage('Allure Report') {
            steps {
                sh "docker run --rm -v ${WORKSPACE}/allure-report:/app/allure-report ${IMAGE_NAME} npm run allure"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'allure-report/**', fingerprint: true
        }
    }
}
