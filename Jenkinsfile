pipeline {
    agent any

    parameters {
        string(name: 'AWS_REGION', defaultValue: 'ap-south-1', description: 'AWS Region')
        string(name: 'AMI_ID', defaultValue: 'ami-04e81358dc84d661d', description: 'AMI ID')
        string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro', description: 'Instance type')
        string(name: 'INSTANCE_NAME', defaultValue: 'example-instance', description: 'Instance name')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('access_key_aws')
        AWS_SECRET_ACCESS_KEY = credentials('secret_key_aws')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/RajkumarReddy021/Jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                    terraform apply -auto-approve -var="aws_region=${params.AWS_REGION}" \
                                    -var="ami_id=${params.AMI_ID}" \
                                    -var="instance_type=${params.INSTANCE_TYPE}" \
                                    -var="instance_name=${params.INSTANCE_NAME}"
                """
            }
        }

        stage('Terraform Output') {
            steps {
                sh 'terraform output'  // Print outputs
            }
        }

        stage('Terraform Destroy') {
            steps {
                input 'Are you sure you want to destroy the resources?'
                sh """
                    terraform destroy -auto-approve -var="aws_region=${params.AWS_REGION}" \
                                      -var="ami_id=${params.AMI_ID}" \
                                      -var="instance_type=${params.INSTANCE_TYPE}" \
                                      -var="instance_name=${params.INSTANCE_NAME}"
                """
            }
        }
    }

    post {
        always {
            sh 'terraform output'  // Print outputs again, if needed
        }
    }
}
