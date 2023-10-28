pipeline{
        agent any
        environment {
            AWS_ACCESS_KEY_ID = credentials("AWS_ACCESS_KEY_ID")
            AWS_SECRET_ACCESS_KEY = credentials("AWS_SECRET_ACCESS_KEY")
            AWS_DEFAULT_REGION = "us-east-1"
        }
        stages{
            
            stage ('Checkout SCM'){
                steps{
                    script {
                        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/monk8081/terraform-jenkis-eks.git']])
                    }
                }
            }
            
            stage ('Intializing Terraform') {
                steps{
                    script{
                        dir('EKS'){
                            sh 'terraform init'
                        }
                    }
                }
            }
            
            stage ('Formatting Terraform Code'){
                steps{
                  script{
                      dir('EKS'){
                          sh 'terraform fmt'
                      }
                  } 
                }
            }
            
            stage ('Validating Terraform'){
                steps{
                    script{
                        dir('EKS'){
                          sh 'terraform validate'
                        }
                    }
                }
            }

            stage ('Previewing the Infra using Terraform'){
                steps{
                    script{
                        dir('EKS'){
                            sh 'terraform plan'
                        }
                        input(message: "Are you sure to proceed?", ok: "Proceed")
                    }
                }
            }


           
            
         
         
        }   
    
    
}
