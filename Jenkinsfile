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
            try {
                echo 'Running docker image...'
                sh "CD=red"
                sh "docker run --env creation_date=$CD -d -p 8345:80 sodbaveka/sodbaveka-app:v1.0.${BUILD_NUMBER}"
                echo 'Run OK'
            } catch (error) {
            } finally {
                echo 'Finally'
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