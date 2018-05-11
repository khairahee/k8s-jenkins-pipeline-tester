def appName = 'k8s-jenkins-pipeline-tester'
def gitProvider = 'github.com'
def appRepo = "microdc/${appName}"
def nameSpace = 'apps'

node() {

def repo = checkout scm
def gitVersion = sh(returnStdout: true, script: 'git describe --tags --dirty=.dirty').trim()

  stage('Checkout repo') {
    git url: "git@${gitProvider}:${appRepo}.git"
  }

  stage('Build') {
      sh "/bin/sh build.sh"
  }

  stage('Update deployment') {
    if (env.BRANCH_NAME == 'master') {
      sh "kubectl apply -f k8s.yaml"
      sh "kubectl set image deployment/${appName} ${appName}=${appRepo}:${gitVersion} -n ${nameSpace}"
    }
  }
}


