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
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging...'
                sh "mkdir -p artefacts"
                sh 'echo "<H1>" > artefacts/index.html'
                sh "echo artefact-${BUILD_TAG} >> artefacts/index.html"
                sh 'echo "<H1>" >> artefacts/index.html'
                sh "cat artefacts/index.html"
                echo 'OK'
            }
        }    
        stage('Built and push docker image') {
            steps {
                echo 'Building docker image...'
                sh "docker build -t sodbaveka/sodbaveka-app:v1.0.${BUILD_NUMBER} ."
                echo 'Build OK'
                withCredentials([usernamePassword(credentialsId: 'dockerhub',passwordVariable: 'DOCKER_PASSWORD',usernameVariable: 'DOCKER_USERNAME')]) {
                    echo 'Pushing docker image...'
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                    sh "docker push sodbaveka/sodbaveka-app:v1.0.${BUILD_NUMBER}"
                    sh "docker tag sodbaveka/sodbaveka-app:v1.0.${BUILD_NUMBER} sodbaveka/sodbaveka-app:latest"
                    sh "docker push sodbaveka/sodbaveka-app:latest"
                    echo 'Push OK'
                }    
            }
        }    
        stage('Staging deployment') {
            steps {
                script {
                    try {
                        echo 'Running docker image...'
                        sh '''docker run -e creation_date="`date`" -d -p 8345:80 sodbaveka/sodbaveka-app:v1.0."${BUILD_NUMBER}"'''
                        echo 'Run OK'  
                    } catch (error) {
                        echo 'Error'
                    }
                }
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