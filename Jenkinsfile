pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    environment {        
        DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
    }

    stages {        
        stage('C# Stages') {            
            stages { 
                stage('Build the C# Code') { 
                    steps {
                        checkout scm
                        sh "echo 'Building..'"
                        sh "dotnet build"
                    }
                }
                stage('Run the C# tests') {
                    steps {
                        sh "echo 'Testing..'"
                        sh "dotnet test"
                    }
                }
            }
        }
    }       
}