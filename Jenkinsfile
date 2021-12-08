

pipeline{
    environment {
        registry = "nlrcmani/dotnet-sample-2"
        registryCredential = 'docker-credentials'
        dockerImage = ''
    }
    agent any 
    stages{
        
            stage('Cloning our Git') {
                steps {
                    script {
                        git branch: 'main' , credentialsId: 'github-user',  url: 'https://github.com/nlrchudamani/dotnet-sample-2.git'
                    }
                    
                }
            }

          
            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                    }
                }
            }

            stage('Cleaning Up') {
                steps{
                  sh "docker rmi --force $registry:$BUILD_NUMBER"
                }
            }

            
            stage('Deploy to cluster') {
                steps{
                  sh "kubectl apply -f ./k8s/second --namespace=dotnet-sample"
                //   sh "kubectl apply -f ./k8s-sample"
                }
            }

            stage('Update container name'){
                steps{
                    sh "kubectl set image --namespace=dotnet-sample deployment/dotnet-second-deployment dotnet=$registry:$BUILD_NUMBER"
                }
            }
    }
    

}
