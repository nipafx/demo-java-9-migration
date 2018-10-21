# ServiceMonitor - Migration

An example application for my book [_The Java Module System_](https://www.manning.com/books/the-java-module-system?a_aid=nipa&a_bid=869915cb).
The _Service Monitor_ is an application that observes a hypothetical network of microservices by

* contacting individual services
* collecting and aggregating diagnostic data into statistics
* persisting statistics
* making statistics available via REST

It is split into a number of subprojects that focus on specific concerns.
Each project has its own directory that contains the known folder structure, e.g. `src/main/java`.

It was developed as a Java 8 application and now needs to be made compatible with Java 9+ and then be modularized.

## Branches

Each of the branches contains a different version of the project:

* [`master`](https://github.com/CodeFX-org/demo-java-9-migration/tree/master): starting point, Java 8
* [`migrated`](https://github.com/CodeFX-org/demo-java-9-migration/tree/migrated): compatible with Java 9 to 11
* [`modularized`](https://github.com/CodeFX-org/demo-java-9-migration/tree/modularized): partially modularized

## Build and Execution

In the project's root folder:

* to build: `mvn clean install`
* to run: `java -cp 'app/*' monitor.Main`
* to contact REST endpoints:
	* `curl http://localhost:4567/stats/json`
	* `curl http://localhost:4567/stats/json64 | base64 -d`
	* `curl http://localhost:4567/stats/xml`

## Troubles

Here's what you're facing.
(If you get stuck, check [the guide](guide.adoc).)

### Migration to Java 9

* internal `BASE64Encoder` is gone ~> use `Base64.getEncoder` instead
* JAXB API is not present ~> add _java.xml.bind_
* Common annotations are not present ~> add _java.xml.ws.annotations_
* split package: `javax.annotation` between _java.xml.ws.annotations_ and _jsr-305_ ~> patch _java.xml.ws.annotations_
* old version of Mockito causes warnings ~> update to newer version, e.g. 2.8.47
* application class loader is no longer a `URLClassLoader` ~> use system property `java.class.path`

### Migration to Java 10

* even new version of Mockito may cause problems ~> update to yet newer version, e.g. 2.18.3
* ASM dependency of Maven compiler plugin may cuase problems ~> update to newer version, e.g. 6.1.1

### Migrating to Java 11

* Java EE modules were removed ~> add third-party dependencies
