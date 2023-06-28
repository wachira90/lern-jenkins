pipeline {
    agent { 
        docker { 
//            image 'golang:1.19.1-alpine'
            image 'golang:1.20.5-alpine3.18'
            args '-v ${WORKSPACE}/:/.cache --network=host'
        } 
        
    }
    stages {
        
        stage('CHECK VERSION') {
            steps {
                sh 'go version'
                sh 'pwd'
                sh 'which go'
                sh 'rm -f go.*'
//                sh 'printenv'
            }
        }
        
        stage('BUILD GOLANG') {
            steps {
//                 golang-version THIS UP PARENT FOLDER
              sh 'go mod init  $(basename "$(pwd)")'                
//                sh 'go mod init jenkins-golang'
                sh 'go mod tidy'
//                sh 'export APP_BUILD_NAME=app-v${BUILD_NUMBER}'
//                sh 'go build'
                sh 'go build -o app-v${BUILD_NUMBER}'
            }
        }
        
        stage('SUCCESS') {
            steps {
//                sh 'echo success'
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                sh 'chmod 0775 app-v${BUILD_NUMBER}'
                sh 'exit'
            }
        }        
    }
}
