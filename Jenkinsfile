pipeline {
agent any
stages{
    stage ('scm'){
 steps{
      checkout scm
 }  
    }
stage('validate'){
    steps{
        withMaven(maven: 'mvn') {
     sh 'mvn validate'
}

    }
}
stage('test'){
    steps{
        withMaven(maven: 'mvn', options: [junitPublisher(healthScaleFactor: 1.0)]) {
    sh 'mvn compile test'
}

    }
}
stage('scan'){
    steps{
    withSonarQubeEnv('sonar') {
         withMaven(maven: 'mvn') {
     sh 'mvn sonar:sonar'
}
}
}

}

stage('package'){
    steps{
        withMaven(maven: 'mvn') {
     sh 'mvn package'
}

    }
}
stage('nexus'){
    steps{
        nexusPublisher nexusInstanceId: 'nexus', nexusRepositoryId: 'Zettamine-SHMW-snapshot', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/var/lib/jenkins/workspace/zml_shmw_job_1/target/SpringHibernate-1.1.war']], mavenCoordinate: [artifactId: 'SpringHibernate', groupId: 'SpringHibernate', packaging: 'war', version: '1.0']]]

    }
}
    
}
}
