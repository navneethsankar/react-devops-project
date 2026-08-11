pipeline {
    agent any

    environment {
        DOCKER_USER = 'navaneethsankarem'
        IMAGE_NAME = 'react-static-app'
        IMAGE_TAG = 'v1'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh './build.sh'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-creds',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login \
                        -u "$DOCKER_USER" \
                        --password-stdin
                    '''
                }
            }
        }

        stage('Push Dev Image') {
            when {
                branch 'dev'
            }

            steps {
                sh '''
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} \
                    ${DOCKER_USER}/dev:latest

                    docker push ${DOCKER_USER}/dev:latest
                '''
            }
        }

        stage('Push Prod Image') {
            when {
                branch 'main'
            }

            steps {
                sh '''
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} \
                    ${DOCKER_USER}/prod:latest

                    docker push ${DOCKER_USER}/prod:latest
                '''
            }
        }

        stage('Deploy Application') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'main'
                }
            }

            steps {
                sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}
