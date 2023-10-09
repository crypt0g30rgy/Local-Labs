## Building and running the exploit

### First we create a simple maven project 

> maven will give us a hello world web app.

```bash
 mvn archetype:generate -DgroupId=com.example -DartifactId=example-application -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false
```

### Now we replace the sample application index.jsp

> we use the exploit code in the index.jsp in this repo/folder to replace the helloword example index.jsp

> just replace the contents via your fav editor 'i use nano'

```bash
nano example-application/src/main/webapp/index.jsp
```

### We build the exploit to upload.

> run maven build process

```bash
cd example-application/ && mvn package
```

> run maven debug

```bash
mvn -X package
```
