pipeline {   

    environment {        
        DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
    }

    stages {        
        stage('C# Stages') {   
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
            }         
            stages { 
                stage('Build the C# Code') { 
                    steps {
                        checkout scm                        
                        sh "dotnet build"
                    }
                }
                stage('Run the C# tests') {
                    steps {                        
                        sh "dotnet test"
                    }
                }
            }
        }
        stage('TypeScript Stages') {   
            agent {
                docker { image 'node:14-alpine' }
            }         
            stages { 
                dir('DotnetTemplate.Web'){
                    stage('Build the TypeScript Code') { 
                        steps {
                            sh "npm install && npm run build"
                        }
                    }
                    stage('Run the linter on the TypeScript code') {
                        steps {
                            sh "npm run lint"
                        }
                    }
                    stage('Run the TypeScript tests') {
                        steps {
                            sh "npm t"
                        }
                    }
                }
            }
        }
    }       
}