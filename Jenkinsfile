pipeline {

    agent any
  
    
    parameters { 
      choice(name: 'CHOICES', 
             choices: ['nodejs', 'python', 'all'], 
             description: '') 
    }
  
    stages {

        stage('Build') {
          
            when { 
                anyOf {
                    environment name: 'CHOICES', value: 'nodejs'
                    environment name: 'CHOICES', value: 'all'
                }
            }
            steps {
                echo "Build nodejs and all "
            }
          
            when { 
                anyOf {
                    environment name: 'CHOICES', value: 'python'
                    environment name: 'CHOICES', value: 'all'
                }
            }
            steps {
                echo "Build python and all "
            }

   
        }

        stage('Push') {
            echo "Building"
        }

    }
}
