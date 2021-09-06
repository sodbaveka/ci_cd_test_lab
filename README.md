### Table of Contents
***
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [License](#License)
5. [Ressources](#Ressources)

### General Info
***
Hello World!

My name is Mickaël alias sodbaveka.
I created this repository as a lab to discover ci/cd, jenkins, docker, and kubernetes.

* Creating a cloudformation file to instanciate ec2 jenkins server on a personnal VPC
    * OS update
    * Java installation
    * Jenkins installation
    * Docker installation
* Creating Jenkinsfile with different stages :
    * Build
    * Test
    * Quality
    * Package
    * Built and push docker image
    * Staging deployment
    * Performance
    * Production
    * Monitoring
    * Notification
* Connecting to jenkins ec2 server http://public_ip:8123
* Configurating jenkins ec2 server
    * Creating credentials "dockerhub" to login to Docker Hub
    * Creating a multi-pipeline project and clone GitHub repository
* Modifying cloudformation file to instanciate ec2 staging server
    * OS update
    * Docker installation
    * Run docker latest image
* Connecting to staging ec2 server http://public_ip:8234

...In progress...

Please feel free to message me if you have any questions.

Bye ;-)

### Technologies
***
A list of technologies used within the project :
* AlmaLinux release 8.4 (Electric Cheetah)
* Amazon Linux 2 OS
* AWS CloudFormation
* AWS EC2
* Docker
* Jenkins

### Installation
***
* Download :
```
$  git clone https://github.com/sodbaveka/jenkins_on_aws_test_lab.git
```

* Launch :
```
in progress
```

### License
***
* Copyright: (c) 2021, Mickaël Duchet <sodbaveka@gmail.com>
* GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

### Ressources
***
* https://www.jenkins.io
* https://github.com
* https://www.docker.com
* https://kubernetes.io
* 'bash for dummies’ :-p 

