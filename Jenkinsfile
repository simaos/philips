pipeline {
  agent any
  stages {
    stage('plan') {
      steps {
        sh 'echo "I will Scan plan here"'
      }
    }
    stage('code') {
      steps {
        sh 'echo "I will Check Security Leaks and Secrets here"'
      }
    }

    stage('build') {
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

    stage('Test') {
      parallel {
        stage('Automation Suite') {
          steps {
            sh 'echo  "Run Regression Test"'
          }
        }


        stage('QALT') {
          steps {
            sh 'echo  "Run Load Test"'
          }
        }

        stage('Chaos Engineering') {
          steps {
            sh 'echo "Have Chaos Engineering test"'
          }
        }

      }
    }

    stage('Release- Stage') {
      parallel {
        stage('Deploy - Stage') {
          steps {
            sh 'echo "deploy Staging"'
          }
        }

        stage('Artifact Scanning') {
          steps {
            sh 'echo "Run a Infra Smoke test"'
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

        stage('Patch Management Test') {
          steps {
            sh 'echo "Vulnerable Test"'
          }
        }

      }
    }

  }
}