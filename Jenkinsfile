pipeline {
  agent any
  tools {
        maven 'maven_381'
  }
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/chyuan530/devops-proj4.git', branch: 'main', credentialsId: ''])
      }
    }
    stage('Compile') {
      steps{
        withMaven {
          sh 'mvn clean compile'
        }
      }
    }
    stage('Test') {
      steps{
        withMaven {
          sh 'mvn test'
        }
      }
    }
    stage('Package') {
      steps{
        withMaven {
          sh 'mvn package -DskipTests=true'
        }
      }
    }
    stage('Deploy AWS') {
      steps{
        ansiblePlaybook(playbook: 'aws_deploy.yml', credentialsId: 'aws')
      }
    }
  }
  post {
      always {
          junit 'target/surefire-reports/*.xml'
      }
  }
}
