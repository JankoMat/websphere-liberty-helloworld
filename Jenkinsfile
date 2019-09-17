node("maven") {
 try {
   stage('clone sources') {
       checkout scm
   }
   stage('create image') {
       sh 'oc start-build sample --from-dir=. -n jm-test --follow'
   }
 } 
 catch (e) {
   // If there was an exception thrown, the build failed
   currentBuild.result = 'FAILURE'
   throw e
 }
}
