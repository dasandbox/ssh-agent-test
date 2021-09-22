pipeline {
  agent 'agent1'

  stages {
      
      stage('git') {
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
          steps {
              sh '''
              pwd; ls -al
              transfer.sh
              '''
          }
      }
  }

}
