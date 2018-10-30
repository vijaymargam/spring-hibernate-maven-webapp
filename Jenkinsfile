pipeline {
agent any
stages{
    stage ('git scm'){
 steps{
      git 'https://github.com/vijaymargam/spring-hibernate-maven-webapp.git'
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
    sh 'mvn test'
}

    }
}
stage('scan'){
    steps{
    withSonarQubeEnv('krish') {
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
        nexusPublisher nexusInstanceId: '1234', nexusRepositoryId: 'release1.0', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '/var/lib/jenkins/workspace/practice/target/SpringHibernateExample-1.1.war']], mavenCoordinate: [artifactId: 'SpringHibernateExample', groupId: 'com.websystique.springmvc', packaging: 'war', version: '1.1']]]

    }
}
    
}
}
