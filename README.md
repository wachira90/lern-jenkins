# lern-jenkins
lerning jenkins

## install java

````
sudo apt update

sudo apt install fontconfig openjdk-11-jre
````

## download run jenkins

````
wget https://get.jenkins.io/war-stable/2.375.1/jenkins.war

java -jar jenkins.war

java -jar jenkins.war --httpPort=9090

java -jar jenkins.war --httpPort=9090 & > 2 &
````

## install from source

````
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins
````

## instruction from url

````
http://localhost:8080
````

### https://pkg.jenkins.io/debian-stable/
