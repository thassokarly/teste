pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'playwright-tests'
    }

    stages {
        stage('Node.js Deps') {
            steps {
                sh 'npm install'
            }
        }

        stage('E2E Tests') {
            steps {
                sh 'npx playwright test'
            }
        }
}
