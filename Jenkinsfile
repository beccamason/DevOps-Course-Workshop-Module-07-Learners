pipeline {
    agent none

    stages {
        stage('Build & test dotnet') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:6.0'}
            }       
            environment {
                DOTNET_CLI_HOME='/tmp/dotnet_cli_home'
            }     
            steps {
                sh 'dotnet build'
                sh 'dotnet test'              
            }
        }
        stage('Build & test typescript') {
            agent {
                docker { image 'node:17-bullseye'}
            }
            steps {
                dir('DotnetTemplate.Web'){
                    sh 'npm install'
                    sh 'npm run build'
                    sh 'npm t'
                    sh 'npm run lint'
                }
            }
        }
    }

}