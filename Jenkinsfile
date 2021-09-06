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
                sh "mkdir -p ${JOB_NAME}/artefacts"
                sh "echo artefact-${BUILD_TAG} > ${JENKINS_HOME}/${JOB_NAME}/artefacts/index.html"
                sh "mkdir -p /home/theseus/${JOB_NAME}/artefacts"
                echo 'OK'
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