# CICD task

## Requirements
Create a Jenkinsfile for a dotnet project
The pipeline should include stages for build, test and deploy.
Use a sample application or script for demonstration purposes.
https://github.com/dodyg/practical-aspnetcore/tree/net6.0/projects/testing/nunit-1

## How to test:

1. Build and start the jenkins container.
```
docker build . -t jenkins-latest
docker volume create jenkins-data
docker run -d -p 8080:8080/tcp -v jenkins-data:/var/jenkins_home jenkins-latest
```
2. Import the build from the jenkinsfile.
```
NewItem -> Pipeline -> Pipeline script from SCM 
```

3. Run the build.