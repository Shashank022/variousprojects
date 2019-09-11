pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }

        stage('Docker Image') {
            agent { 
                docker {
                image 'spothakanoori/nodeapp'
                }
            }
            steps {
                sh 'docker -v'
                unstash 'Dockerfile'
                sh 'docker build -t https://github.com/Shashank022/variousprojects:jenkins .'
            }
        }
    }
}