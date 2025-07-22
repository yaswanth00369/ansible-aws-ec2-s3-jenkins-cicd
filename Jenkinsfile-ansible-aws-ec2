pipeline {
    agent { label 'ansible-node' }

    environment {
        AWS_SHARED_CREDENTIALS_FILE = '/home/ec2-user/.aws/credentials'
    }

    stages {

        stage('Run Ansible Playbook') {
            steps {
                sh '''
                ansible-playbook ansible-aws-ec2-deploy.yaml
                # ansible-playbook ansible-aws-ec2-deploy.yaml --extra-vars "instance_name=yaswanth-demo-instance-${BUILD_NUMBER}"
                '''
            }
        }
    }
}
