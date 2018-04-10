def appName = 'k8s-jenkins-pipeline-tester'
def gitProvider = 'github.com'
def appRepo = "microdc/${appName}"
def label = "${UUID.randomUUID().toString()}"
def nameSpace = 'apps'

podTemplate(label: label, inheritFrom: 'jenkins-slave') {

  node(label) {

  def gitVersion = sh(returnStdout: true, script: 'git describe --tags --dirty=.dirty').trim()

    stage('Checkout repo') {
      git url: "git@${gitProvider}:${appRepo}.git"
    }

    stage('Build') {
      container('docker') {
        sh "/bin/sh build.sh"
      }
    }

    stage('Update deployment') {
      container('kubectl') {
        sh "kubectl set image deployment/${appName} ${appName}=${appRepo}:${gitVersion} -n ${nameSpace}"
      }
    }
  }

}
