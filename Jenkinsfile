pipeline {
    agent { label 'docker1' }

    environment {
        IMAGE_NAME = 'rajibconf/clean_work'
        IMAGE_TAG = "${env.BUILD_NUMBER}"
        IMAGE_TAG2 = "latest"
        REMOTE_USER = "vagrant"
        REMOTE_HOST = "192.168.33.50"
        STACK_FILE = "/home/vagrant/devops_project/docker-website-lab/docker-stack.yml"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh """
                    cd docker-website-lab
                    docker build -t $IMAGE_NAME:$IMAGE_TAG .
                    docker tag $IMAGE_NAME:$IMAGE_TAG $IMAGE_NAME:$IMAGE_TAG2
                """
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $IMAGE_NAME:$IMAGE_TAG
                        docker push $IMAGE_NAME:$IMAGE_TAG2
                    """
                }
            }
        }

        stage('Deploy to Swarm') {
            steps {
                sshagent(['remote-host-server']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST \\
                        "docker stack deploy -c $STACK_FILE clean_work_stack"
                    """
                }
            }
        }
    }
}
