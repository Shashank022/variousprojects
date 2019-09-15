pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
                // echo 'Building..'
                // sh "sudo docker build -t vuejsproj:latest npm install"
                sh "chmod +x './prework.sh'"
                sh "./prework.sh"
            }
        }
       
        stage('Deploy'){
             steps {
                sh "docker run -it -p http://192.168.0.12:8000 --rm --name spothakanoori/vuejsproj spothakanoori/vuejsproj:latest"
                //sh "chmod +x './prework.sh'"
                //sh "./prework.sh"
             }

        }
    }
    
}