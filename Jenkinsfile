pipeline {
    agent {label "linux"} 

    environment {
        PACKER_VERSION = "1.11.2"
        PACKER_URL = "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
        OPENSTACK_CREDENTIALS = credentials('25')
        BASELINE_REPO = 'https://git.your-company.com/scm/ci/jenkins-image-automation.git'
        BASELINE_BRANCH = 'rocky-linux'
        BASELINE_CMD = './newconfig.py'
        OS_AUTH_URL = 'https://openstackvip01.ece.your-company.com:5000'
        OS_PROJECT_ID = '12d342343488a607a4525b4dcc68'
        OS_PROJECT_NAME = 'devops - Infrastructure'
        OS_USER_DOMAIN_NAME = 'Cloud'
        OS_PROJECT_DOMAIN_ID = '2ebe9be56434524314c85dbb6543688'
        OS_REGION_NAME = 'envprod'
        OS_INTERFACE = 'public'
        OS_IDENTITY_API_VERSION = '3'
        OS_PASSWORD = "$OPENSTACK_CREDENTIALS_PSW"
    }

    stages {

        stage('Download and Install Packer') {
            steps {
                script {
                    sh '''
                    echo "Downloading Packer version ${PACKER_VERSION}..."
                    wget ${PACKER_URL} -O /tmp/packer.zip
                    echo "Unzipping Packer binary..."
                    sudo unzip -o /tmp/packer.zip -d /usr/local/bin/
                    echo "Making Packer executable..."
                    sudo chmod +x /usr/local/bin/packer
                    echo "Cleaning up..."
                    rm -f /tmp/packer.zip
                    echo "Verifying Packer installation..."
                    packer --version
                    '''
                }
            }
        }
       stage('Packer Image Validate') {
          steps {
             sh ''' packer init .
                    pwd 
                    ls
                    packer validate .  '''
          }
       }
   
      stage('Packer Build') {
         steps {
            sh 'packer build .'
      }
    }
   }
      post {
          always {
              echo "Cleaning up the workspace post build"
          }
      }

    

}
