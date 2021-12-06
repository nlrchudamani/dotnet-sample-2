

pipeline{
    environment {
        registry = "nlrcmani/dotnet-sample-1"
        registryCredential = 'docker-credentials'
        dockerImage = ''
    }
    agent any 
    stages{
        
           

            stage('Building Docker Image') {
                steps {
                    sh "docker build -t nlrcmani/dotnet-sample-1:latest ."
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    sh "docker push nlrcmani/dotnet-sample-1:latest"
                }
            }

            stage('Cleaning Up') {
                steps{
                  sh "docker rmi --force $registry:$BUILD_NUMBER"
                }
            }
    }
    

}
