node {

  stage('git') {
    
    sshagent(credentials: ['github-key-sec']) {
      // get the last commit
      sh 'git ls-remote -h --refs git@github.com:dasandbox/ssh-agent-test.git master |awk "{print $1}"'
    
    }
    
  }
  
}
