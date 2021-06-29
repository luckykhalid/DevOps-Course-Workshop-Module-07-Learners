pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    stages {
        stage('Checkout'){
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh "echo 'Building..'"
                sh 'dotnet build'
            }
        }
        /*stage('Test') {
            steps {
                sh echo 'Testing..'
                sh dotnet test
            }
        } */       
    }
}