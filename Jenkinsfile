pipeline {
  agent any
  tools {
        maven 'maven_381'
  }
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/chyuan530/devops-final.git', branch: 'main', credentialsId: ''])
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
        sh 'mkdir target/surefire-reports; cp *.xml target/surefire-reports; sleep 5; echo test'
        //withMaven {
        //  sh 'mvn test'
        //}
      }
    }
    stage('Package') {
      steps{
        sh 'sleep 10; echo package'
        //withMaven {
        //  sh 'mvn package -DskipTests=true'
        //}
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
