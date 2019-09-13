pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
            
                echo 'Building..'
                sh "sudo docker build --name vuejsproj:latest npm install"
                sh "sudo docker run -it vuejsproj:latest"

                //sh "chmod +x './prework.sh'"
                //sh "./prework.sh"
            }
        }
    }
}