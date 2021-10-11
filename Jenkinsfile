pipeline {
    
    agent any
    
    environment {
        
        DOCKERHUB_USERNAME = 'nblam1994'
        DOCKERHUB_PWD = credentials('docker-hub-pass')
        
        NODE_JS_REPO = 'https://github.com/lnguyen-cpi/node-hello.git'
        NODE_JS_DIR = 'node-hello'
        
        PYTHON_REPO = 'https://github.com/lnguyen-cpi/python-hello.git'
        PYTHON_APP = 'python-hello'
    }

    parameters { 
      choice(name: 'CHOICES', 
             choices: ['nodejs', 'python', 'all'], 
             description: '',
             //required: true 
             ) 
    }
  
    stages {
        
        stage('Build NodeJs') {
            
            agent { label "master" }
            when {
                expression { 
                   return params.CHOICES == 'nodejs'
                }
            }
           steps {
               sh '''
                    ./nodejs/build.sh
                '''
            }
        }
        
        
        stage('Build Python') {
            
            agent { label "master" }
            when {
                expression { 
                   return params.CHOICES == 'python'
                }
            }
           steps {
                sh '''
                    ./python/build.sh
                '''
            }
        }
        
        
        stage('Build All') {
            
            when { 
                expression { 
                   return params.CHOICES == 'all'
                }
            }
           parallel {
               
                stage('Build NodeJs') {
                    agent { label "master" }
                    steps {
                        sh '''
                            ./nodejs/build.sh
                        '''
                    }
                }
                stage('Build Python') {
                    agent { label "master" }
                    steps {
                        sh '''
                             ./python/build.sh
                        '''
                    }
                }
            }
        }
        
        
        stage('Push NodeJs') {
            
            agent { label "master" }
            when { 
                expression { 
                   return params.CHOICES == 'nodejs'
                }
            }
           steps {
               sh '''
                    ./nodejs/push.sh
               '''
            }
        }
        
        stage('Push Python') {
            
            agent { label "master" }
            when { 
                expression { 
                   return params.CHOICES == 'python'
                }
            }
           steps {
                 sh '''
                   ./python/push.sh
                '''
            }
        }
        
        stage('Push All') {
            
            when { 
                expression { 
                   return params.CHOICES == 'all'
                }
            }
            parallel {
               
                stage('Push NodeJs') {
                    agent { label "master" }
                    steps {
                        sh '''
                            ./nodejs/push.sh
                        '''
                    }
                }
                stage('Push Python') {
                    agent { label "master" }
                    steps {
                        sh '''
                             ./python/push.sh
                        '''
                    }
                }
            }
        }
        
        
        stage('Deploy NodeJs') {
            
            agent { label "node-1" }
            when { 
                expression { 
                   return params.CHOICES == 'nodejs'
                }
            }
           steps {
                sh '''
                    ./nodejs/deploy.sh
                '''
            }
        }
        
        
        stage('Deploy Python') {
            
            agent { label "node-1" }
            when { 
                expression { 
                   return params.CHOICES == 'python'
                }
            }
           steps {
                 sh '''
                   ./python/deploy.sh
                '''
            }
        }
        
        
        stage('Deploy All') {
            
           
            when { 
                expression { 
                   return params.CHOICES == 'all'
                }
            }
            parallel {
               
                stage('Deploy NodeJs') {
                    agent { label "node-1" }
                    steps {
                        sh '''
                            ./nodejs/deploy.sh
                        '''
                    }
                }
                stage('Deploy Python') {
                    agent { label "node-1" }
                    steps {
                        sh '''
                             ./python/deploy.sh
                        '''
                    }
                }
            }
        }

    }
}