pipeline {
    agent any

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Clone Latest Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Mohansivakumar017/Jenknis-1.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify WAR File') {
            steps {
                sh 'ls -l target/'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                sh '''
                docker stop contnr || true
                docker rm contnr || true
                '''
            }
        }

        stage('Remove Old Docker Images') {
            steps {
                sh '''
                docker rmi -f img || true
                docker image prune -f
                '''
            }
        }

        stage('Docker Build (No Cache)') {
            steps {
                sh 'docker build --no-cache -t img .'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh 'docker run -d -p 6060:8080 --name contnr img'
            }
        }

        stage('Docker Status Check') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
