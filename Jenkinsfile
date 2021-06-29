pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    stages {        
        stage('Build') {
            steps {
                checkout scm
                sh "echo 'Building..'"
                sh 'dotnet build DotnetTemplate.sln'
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