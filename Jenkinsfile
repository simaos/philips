pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        sh 'echo "I will Build it here"'
      }
    }

    stage('Unit Test') {
      parallel {
        stage('Unit Test') {
          steps {
            sh 'echo "Check Unit Test Results"'
          }
        }

        stage('SAST') {
          steps {
            sh 'echo  "Will need a Static Code Analaysis" '
          }
        }

        stage('DAST') {
          steps {
            sh 'echo "Will run a Dynamic Test Scan"'
          }
        }

        stage('IAST') {
          steps {
            sh 'echo "IAST"'
          }
        }

        stage('RAST') {
          steps {
            sh 'echo "Runtime application self protection"'
          }
        }

        stage('DLP') {
          steps {
            sh 'echo "Data Loss Protection"'
          }
        }

        stage('SCA') {
          steps {
            sh 'echo "Software composition analysis"'
          }
        }

        stage('OSS') {
          steps {
            sh 'echo "Open Source Software Governance"'
          }
        }

      }
    }

    stage('Automation Suite') {
      parallel {
        stage('Automation Suite') {
          steps {
            sh 'echo  "Run Regression Test"'
          }
        }

        stage('Chaos Engineering') {
          steps {
            sh 'echo "Have Chaos Engineering test"'
          }
        }

      }
    }

    stage('Deploy - Stage') {
      parallel {
        stage('Deploy - Stage') {
          steps {
            sh 'echo "deploy Staging"'
          }
        }

        stage('Infra Smoke Test') {
          steps {
            sh 'echo "Run a Infra Smoke test"'
          }
        }

        stage('Monitoring Test') {
          steps {
            sh 'echo "Monitor Test"'
          }
        }

      }
    }

  }
}