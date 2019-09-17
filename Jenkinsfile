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

          stage('Test') {
            steps {
                echo 'Building anotherJob and getting the log'
                script {
                    def bRun = build 'anotherJob' 
                    echo 'last 100 lines of BuildB'
                    for(String line : bRun.getRawBuild().getLog(100)){
                        echo line
                    }
                }
            }
          }
       
        stage('Deploy'){
             steps {
                 echo "This is log"
                //sh "chmod +x './prework.sh'"
                //sh "./prework.sh"
             }

        }
    }
    
}