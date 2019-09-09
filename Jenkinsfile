pipeline {
  
  agent {
    docker {
      image 'node'
    }
  }
  stages {
    stage('Clone Sources') {
      steps {
        git 'https://github.com/Shashank022/variousprojects.git'
      }
    }
    stage('Information') {
      steps {
        sh 'node -v'
        sh 'npm -v'
      }
    }
    stage('Config') {
      steps {
        sh 'npm set registry https://registry.npm.taobao.org'
      }
    }
    stage('Dependencies') {
      steps {
        sh 'npm install'
      }
    }
    stage('Unit Test') {
      steps {
        sh 'npm run unit'
      }
    }
    stage('E2E Test') {
      steps {
        sh 'npm run e2e'
      }
    }
    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }
    stage('Artifacts') {
      steps {
      }
    }
    stage('Docker Image') {
      agent {
        docker {
          image 'docker:dind'
        }
      }
      steps {
        sh 'docker -v'
      }
    }
    
  }
}