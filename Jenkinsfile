pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    environment {        
        DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
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