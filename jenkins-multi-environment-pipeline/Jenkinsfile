pipeline {
  agent none
  stages {
    stage('Fluffy Build') {
      parallel {
        stage('Build Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            sh './jenkins/build.sh'
            stash(name: 'Java 8', includes: 'target/**')
          }
        }
        stage('Build Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            sh './jenkins/build.sh'
            archiveArtifacts 'target/*.jar'
            stash(name: 'Java 7', includes: 'target/**')
          }
        }
      }
    }
    stage('Fluffy Test') {
      parallel {
        stage('Backend Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            unstash 'Java 8'
            sh './jenkins/test-backend.sh'
            junit 'target/surefire-reports/**/TEST*.xml'
          }
        }
        stage('Frontend') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            unstash 'Java 8'
            sh './jenkins/test-frontend.sh'
            junit 'target/test-results/**/TEST*.xml'
          }
        }
        stage('Performance Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            unstash 'Java 8'
            sh './jenkins/test-performance.sh'
          }
        }
        stage('Static Java 8') {
          agent {
            node {
              label 'java8'
            }

          }
          steps {
            unstash 'Java 8'
            sh './jenkins/test-static.sh'
          }
        }
        stage('Backend Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            unstash 'Java 7'
            sh './jenkins/test-backend.sh'
            junit 'target/surefire-reports/**/TEST*.xml'
          }
        }
        stage('Frontend Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            unstash 'Java 7'
            sh './jenkins/test-frontend.sh'
            junit 'target/test-results/**/TEST*.xml'
          }
        }
        stage('Performance Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            unstash 'Java 7'
            sh './jenkins/test-performance.sh'
          }
        }
        stage('Static Java 7') {
          agent {
            node {
              label 'java7'
            }

          }
          steps {
            unstash 'Java 7'
            sh './jenkins/test-static.sh'
          }
        }
      }
    }
    stage('Confirm Deploy') {
      steps {
        input(message: 'Okay to Deploy to Staging?', ok: 'Let\'s Do it!')
      }
    }
    stage('Fluffy Deploy') {
      agent {
        node {
          label 'java7'
        }

      }
      steps {
        unstash 'Java 7'
        sh './jenkins/deploy.sh staging'
      }
    }
  }
}
