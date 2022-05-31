pipeline {
    agent none

    stages {
        stage('Build & test dotnet') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:6.0'}
            }            
            steps {
                sh "dotnet build"
                sh "dotnet test"
                
            }
            environment {
                DOTNET_CLI_HOME='/tmp/dotnet_cli_home'
            }
        }
    }
}