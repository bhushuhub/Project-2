pipeline{
    agent{
        node{
            label 'master'
            customWorkspace '/mnt/project'
        }
    }
    stages{
        stage ('cloning the repo'){
            steps{
                sh "rm -rf /mnt/project/*"
                sh "git clone 'https://github.com/bhushuhub/webapp.git'"
            }
        }
        stage ('build-project'){
            agent{
                node{
                    label 'master'
                    customWorkspace '/mnt/project/webapp'
                }
            }
            steps{
                sh "mvn clean install"
            }
        }
        stage ('deploy on slave-1'){
            agent{
                node{
                    label 'master'
                    customWorkspace '/mnt/project/webapp/target'
                }
            }
            steps{
                sh "chmod -R 777 WebApp.war"
                sh "scp -i '/mnt/new-keypair.pem' WebApp.war ec2-user@172.31.95.139:/mnt/apache-tomcat-9.0.70/webapps/"
            }
        }
        stage ('deploy on slave-2'){
            agent{
                node{
                    label 'master'
                    customWorkspace '/mnt/project/webapp/target'
                }
            }
            steps{
                sh "chmod -R 777 WebApp.war"
                sh "scp -i '/mnt/new-keypair.pem' WebApp.war ec2-user@172.31.88.176:/mnt/apache-tomcat-9.0.70/webapps"
            }
        }
    }
}
