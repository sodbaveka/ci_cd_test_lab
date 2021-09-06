pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh "echo workspace=${WORKSPACE}"
                sh "echo jenkins_home=${JENKINS_HOME}"
                sh "echo job=${JOB_NAME}"
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'src/TestScript'
            }
        }
        stage('Quality') {
            steps {
                echo 'Analysing code quality...'
                sh 'python3 src/QualityScript'
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging...'
                sh "mkdir -p artefacts"
                sh "echo artefact-${BUILD_TAG} > artefacts/index.html"
                sh "cat artefacts/index.html"
                echo 'OK'
            }
        }    
        stage('Built docker image') {
            steps {
                echo 'Building docker image...'
                sh "docker build -t localhost/sodbaveka-app:v1.0.0"
                echo 'Build OK'
                echo 'Running docker image...'
                sh "docker run -d -p 8234:8234 localhost/sodbaveka-app:v1.0.0"
                echo 'Run OK'
            }
        }    
        stage('Staging deployment') {
            steps {
                echo 'Staging deployment...'
                echo 'OK'
            }
        }   
        stage('Performance') {
            steps {
                echo 'Performance testing...'
                echo 'OK'
            }
        }   
        stage('Production') {
            steps {
                echo 'Deploying...'
                echo 'OK'
            }
        }   
        stage('Monitoring') {
            steps {
                echo 'Monitoring...'
                echo 'OK'
            }
        }   
        stage('Notification') {
            steps {
                echo 'Notifying...'
                echo 'OK'
            }
        }   
    }
    post {
        always {
            echo 'All stages passed'
        }
    }
}