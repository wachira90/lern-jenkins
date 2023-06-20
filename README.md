# lern-jenkins

lerning jenkins

## install java

```sh
sudo apt update

sudo apt install fontconfig openjdk-11-jre
```

## download run jenkins

```sh
wget https://get.jenkins.io/war-stable/2.387.2/jenkins.war

java -jar jenkins.war

java -jar jenkins.war --httpPort=9090

java -jar jenkins.war --httpPort=9090 & > 2 &

java -jar jenkins.war --httpPort=9090 > log-$(date '+%Y-%m-%d').log 2>&1 &

# THIS OK
java -jar jenkins.war --httpPort=30001 > log-$(date '+%Y-%m-%d').log > /dev/null &>2 &
```

## install from source

```sh
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins
```

## instruction from url

```
http://localhost:8080
```

## schedule

```groovy
pipeline {
  agent any
  schedule '0 2 * * *'
  stages {
    stage('Build') {
      steps {
        // your build steps go here
      }
    }
  }
}
```

## reset build number

http://myurl-jenkins:3000/script

```groovy
item = Jenkins.instance.getItemByFullName("golang-version")
item.builds.each() { 
  build ->build.delete()
}
item.updateNextBuildNumber(1)
```

### https://pkg.jenkins.io/debian-stable/

### https://www.jenkins.io/doc/pipeline/tour/hello-world/
