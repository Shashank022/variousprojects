pipeline {
  
  agent any
  
 stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "chmod -x './prework.sh'"
                sh "./prework.sh"
            }
        }
    }
}