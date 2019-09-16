node("maven") {
 try {
   stage('clone sources') {
       checkout scm
   }
   stage('create image') {
       sh 'chown 1001:0 *.ear'
       sh 'chown 1001:0 *.xml'
       sh 'oc start-build helloworld --from-dir=. -n jm-test --follow'
   }
 } 
 catch (e) {
   // If there was an exception thrown, the build failed
   currentBuild.result = 'FAILURE'
   throw e
 }
}
