# jenkins build process

## Jenkins Master

```sh
docker build -t jenkins2 -f master/Jenkins.Dockerfile .
```

## Jenkins Data

```sh
docker build -t jenkins-data -f volume/Volume.Dockerfile .
```

## run Jenkins Volume

```sh
docker run --name=jenkins-data jenkins-data
```

## run Jenkins Master

```sh
docker run -p 8080:8080 -p 50000:50000 --name=jenkins-master --volumes-from=jenkins-data -d jenkins2
```

## คำสั่ง run ของ docker

```
 - name หมายถึง ตั้งชื่อ name ของ container
 - -p หมายถึง การกำหนดให้ port ชี้ไปที่ port ใน container
 - volumns หมายถึง การกำหนดให้ directory ต่อไปยัง อีก directory หนึ่ง
```

## accress URL

```
http://localhost:8080/
```

initialAdminPassword มาจาก path ตามนี้ /var/jenkins_home/secrets/initialAdminPassword ซึ่งเป็น path ที่อยู่ใน docker

## get password

```sh
docker exec jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword
```

