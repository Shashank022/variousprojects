pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
                sudo su visudo -f /etc/sudoers          
                echo 'Building..'
                sh "sudo docker build --name vuejsproj:latest npm install"
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

    jenkins ALL= NOPASSWD: ALL
}