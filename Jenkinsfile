pipeline {
    agent {
        docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                dotnet build
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                dotnet test
            }
        }        
    }
}