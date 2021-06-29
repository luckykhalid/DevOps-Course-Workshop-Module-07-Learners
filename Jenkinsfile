pipeline {

    agent none

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
                stage('Build/Lint/Test the TypeScript Code') { 
                    steps {
                        dir('DotnetTemplate.Web') {
                            sh "npm install && npm run build"                            
                        }
                    }
                }
                stage('Run the linter on the TypeScript code') {
                    steps {
                        dir('DotnetTemplate.Web') {
                            sh "npm run lint"
                        }
                    }
                }
                stage('Run the TypeScript tests') {
                    steps {
                        dir('DotnetTemplate.Web') {
                            sh "npm run test-with-coverage"
                        }
                        publishCoverage adapters: [istanbulCoberturaAdapter(path: 'DotnetTemplate.Web/coverage/cobertura-coverage.xml', thresholds: [[failUnhealthy: true, thresholdTarget: 'Aggregated Report', unhealthyThreshold: 90.0, unstableThreshold: 90.0]])], sourceFileResolver: sourceFiles('NEVER_STORE')
                    }
                }
            }
        }
    }
}       
