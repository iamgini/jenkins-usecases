# jenkins-demo
Jenkins Sandbox Docs


First Admin password can be found at : /var/jenkins_home/secrets/initialAdminPassword

### Sample docker-compose.yml
```
version: '3'
services:
  jenkins:
    tty: true
    stdin_open: true
    container_name: jenkins
    image: jenkins/jenkins
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
networks:
 net:
```