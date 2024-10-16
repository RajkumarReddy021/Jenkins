pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('access_key_aws')
        AWS_SECRET_ACCESS_KEY = credentials('secret_key_aws')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/your-repo/terraform-jenkins-demo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            sh 'terraform output'  // Optional: Print outputs
        }
    }
}
