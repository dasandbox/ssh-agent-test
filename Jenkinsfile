pipeline {
    agent none

    stages {
      
      stage('git') {
          //agent any
          agent { label 'agent1' }
          steps {
              sshagent(credentials: ['github-key-sec']) {
                  // get the last commit
                  sh '''
                  git ls-remote -h --refs git@github.com:dasandbox/ssh-agent-test.git main | awk '{print $1}'
                  '''
              }
          }
      }
      stage('Data Transfer') {
          agent { label 'agent1' }
          steps {
              sshagent(credentials: ['github-key-sec']) {
                  sh '''
                  pwd; ls -al
                  ./transfer.sh
                  '''
              }
          }
      }
    }

}
