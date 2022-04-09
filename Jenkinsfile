
pipeline {
    agent any

    stages {
         stage('1-Build') {
              steps {
                   echo "Start of stage build"
                                  echo "Building...."
                                  echo "End of building"
              }
         }
         stage('1-Test') {
             steps {
                  echo "Start of stage test"
                                 echo "testing"
                                 echo "end of testing"
             }
         }
         stage('3-Deploy') {
             steps {
                 sshPublisher(publishers: [sshPublisherDesc(configName: 'mywebserver',
                 transfers: [sshTransfer(cleanRemote: false, excludes: '',
                 execCommand: '''docker build -t docktest .
                 docker-compose down
                 docker stop $(docker ps -a -q)
                 docker rm $(docker ps -a -q)
                 docker rmi $(docker images -a -q)
                 docker system prune -af
                 docker-compose up -d''',
                 execTimeout: 120000,
                 flatten: false,
                 makeEmptyDirs: false,
                 noDefaultExcludes: false,
                 patternSeparator: '[, ]+',
                 remoteDirectory: '/home/ubuntu',
                 remoteDirectorySDF: false,
                 removePrefix: '', sourceFiles: '**')],
                 usePromotionTimestamp: false,
                 useWorkspaceInPromotion: false,
                 verbose: false)])
             }
         }
    }
}
