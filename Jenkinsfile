pipeline {
    agent any
    triggers {
        // Build every saturday morning
        cron('H 6 * * 6')
    }
    stages {
        stage ('Build Docker Images') {
            steps {
                sh 'cd docker-jenkins && docker build --pull -t scriptinator/jenkins .'
                sh 'cd docker-jenkins-agent && docker build --pull -t scriptinator/jenkins-agent .'
            }
        }
        stage ('Push Docker Image') {
            environment {
                DOCKER_CREDENTIALS = credentials('fa2b99dc-21fa-478b-8e89-6dda3f877194')
            }
            when {
                branch 'master'
            }
            steps {
                sh 'docker login --username "$DOCKER_CREDENTIALS_USR" --password "$DOCKER_CREDENTIALS_PSW"'
                sh 'docker push scriptinator/jenkins'
                sh 'docker push scriptinator/jenkins-agent'
            }
        }
    }
}
