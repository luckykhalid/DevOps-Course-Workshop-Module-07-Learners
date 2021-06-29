pipeline {
    agent any

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