

pipeline{
    agent any 
    stages{
        stage('Testing the pipeline')
        {
            steps {
                sh " echo 'Hello World'"
            }
            
        }

        stage('Check Kubernetes version ')
        {
            steps{
                sh "kubectl version "
            }
            
        }
    }
    

}
