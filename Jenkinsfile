pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "sudo docker build -t vuejsproj:latest npm install"
                //sh "chmod +x './prework.sh'"
                //sh "./prework.sh"
            }
        }
       
        stage('Deploy'){
             steps {
                sh "sudo docker run -it vuejsproj:latest"
                //sh "chmod +x './prework.sh'"
                //sh "./prework.sh"
             }

        }
    }
    
}