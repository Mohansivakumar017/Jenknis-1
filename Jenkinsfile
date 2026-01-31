pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/Mohansivakumar017/Jenknis-1.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                sh '''
                docker stop azure || true
                docker rm azure || true
                '''
            }
        }

        stage('Remove Old Image') {
            steps {
                sh '''
                docker rmi mohan || true
                docker rmi eswar || true
                '''
            }
        }

        stage('Docker Image Build') {
            steps {
                sh 'docker build -t img .'
            }
        }

        stage('Docker Deploy') {
            steps {
                sh 'docker run -d -p 6060:8080 --name contnr amazon'
            }
        }
    }
}
