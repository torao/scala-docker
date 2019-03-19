# scala-docker
[Dockerfile repository](https://cloud.docker.com/u/torao/repository/docker/torao/scala) for using latest Java / Scala (and SBT).

## How to Use

You can use Scala REPL with `docker run` command.

```
$ docker run -it --rm torao/scala
Welcome to Scala 2.12.8 (OpenJDK 64-Bit Server VM, Java 11.0.2).
Type in expressions for evaluation. Or try :help.

scala> 
```

Or, to execute a script written in Scala, mount it on `/opt` and start `bash`.

```
$ docker run -it --rm -v `pwd`:/opt torao/scala bash
root@fc2b7a30f65d:/opt# scala myprog.scala
...
```

`sbt` is also available for this docker image.

```
$ docker run -it --rm -v `pwd`:/opt torao/scala sbt
[info] Loading project definition from /opt/project
[info] Updating ProjectRef(uri("file:/opt/project/"), "opt-build")...
[info] downloading https://repo1.maven.org/maven2/org/apache/logging/log4j/log4j-core/2.11.1/log4j-core-2.11.1-tests.jar ...
[info] 	[SUCCESSFUL ] org.apache.logging.log4j#log4j-core;2.11.1!log4j-core.jar(test-jar) (2073ms)
[info] Done updating.
[info] Set current project to opt (in build file:/opt/)
[info] sbt server started at local:///root/.sbt/1.0/server/bad71b82776d33c67b9c/sock
sbt:opt>
```

To omit library download, you need to remove the `--rm` option and reuse the container.

```
$ docker run -it -v `pwd`:/opt torao/scala bash
root@fc2b7a30f65d:/opt# sbt package
...
```
