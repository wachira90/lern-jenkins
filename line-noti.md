# line noti

```groovy
def notifyLINE(status) {
    def token = "[LINE Access Token]"
    def jobName = env.JOB_NAME +' '+env.BRANCH_NAME
    def buildNo = env.BUILD_NUMBER
      
    def url = 'https://notify-api.line.me/api/notify'
    def message = "${jobName} Build #${buildNo} ${status} \r\n"
    sh "curl ${url} -H 'Authorization: Bearer ${token}' -F 'message=${message}'"
}

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
            sh 'dotnet ef database update -p "Mockup.DAL/Mockup.DAL.csproj" -s "Mockup/Mockup.csproj"'
            sh 'dotnet test "Mockup.Test/Mockup.Test.csproj"'        		
      }
    }
  }
  post{
    success{
        notifyLINE("succeed")
    }
    failure{
        notifyLINE("failed")
    }
  }
}
```
