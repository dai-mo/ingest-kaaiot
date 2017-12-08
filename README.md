
<!-- TOC -->

- [Alambeek KaaIoT Project](#alambeek-kaaiot-project)
    - [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installing](#installing)
    - [Building](#building)
    - [Tests](#tests)
    - [Code style check](#code-style-check)
    - [Publish](#publish)
    - [Deployment](#deployment)
- [Versioning](#versioning)
- [Support](#support)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- /TOC -->


# Alambeek KaaIoT Project
This project consists of modules which form the bridge between the [KaaIoT Platform] and the Alambeek platform. These include,
 * [org.dcs.iot.kaa] : which builds artifact to deploy within the KaaIoT Platform
 * [org.dcs.iot.kaa.client] : which acts as a client to the KaaIoT Platform
 
## Features
Please refer to the individual projects,
* [org.dcs.iot.kaa]
* [org.dcs.iot.kaa.client]  

for their specific features

# Getting Started
The instructions here will get your development environment setup for this project.

## Prerequisites
To build this project you need
 * [sbt 0.13.x] : to build scala sources.
 * [mvn 3.x] : to generate avro schema classes from avro schema files using the maven avro plugin.

## Installing
:warning: The project has to be forked to your own namespace before cloning.

Clone the project  

    $ git clone git@gitlab.nanonet:<your namespace>/dcs_kaaiot.git
      
Change directory
      
    $ cd dcs_kaaiot

Check if the code compiles    

    $ sbt compile
    
## Building    
:warning: All commands provided here must be run in the project root directory.

Generate sources for _org.dcs.iot.kaa_ (in the _org.dcs.iot.kaa/generated_ directory)

    $ mvn generate-sources -pl org.dcs.iot.kaa

...  to produce,
 * class files from Avro Schema files
 
Build module artifacts locally (in the _org.dcs.iot.kaa/target_ and _org.dcs.iot.kaa.client/target_directory)     

    $ sbt package

## Tests
Run tests

    $ sbt test 

## Code style check
TBD

## Publish
To make the artifacts available for other dependent projects, install artifact in local maven repository

    $ sbt publishM2
    
Publish the artifacts to a global artifact store (this will depend on your [sbt publishTo] settings)

    $ sbt publish

## Deployment
The jar produced by the _org.dcs.iot.kaa_ module should be copied to the _/usr/lib/kaa-node/lib_ directory of the KaaIoT instance.

The jar produced by the _org.dcs.iot.kaa.client_ module is used by the _org.dcs.core_ module.

# Versioning
We use [Semantic Versioning]. For the versions available, see the [tags on this repository].

# Support
Please [open an issue] for support.

# Contributing
Please read [CONTRIBUTING.md] for details on our code of conduct, and the process for submitting pull requests to us.

# Authors
* **Cherian Mathew** - [brewlabs]
* **Laurent Briais** - [brewlabs]

See also the list of [contributors] who participated in this project.


# License
This project is licensed under the ??? License - see the [LICENSE.md] file for details


[sbt 0.13.x]:http://www.scala-sbt.org/download.html
[mvn 3.x]:https://maven.apache.org/download.cgi
[sbt publishTo]: http://www.scala-sbt.org/0.13/docs/Publishing.html

[KaaIoT Platform]:https://www.kaaproject.org/
[org.dcs.iot.kaa]:org.dcs.iot.kaa/README.md
[org.dcs.iot.kaa.client]:org.dcs.iot.kaa.client/README.md

[kaaCredentials]: org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml
[kaaConfig]: org.dcs.iot.kaa.client/src/test/resources/kaa-config

[Semantic Versioning]:http://semver.org/
[tags on this repository]:https://gitlab.nanonet/big_data/dcs_commons/tags
[open an issue]:https://brewlabs.atlassian.net/secure/RapidBoard.jspa?rapidView=3&projectKey=AL&view=planning
[contributors]:https://gitlab.nanonet/big_data/dcs_commons/graphs/master
[brewlabs]:www.brewlabs.eu
[CONTRIBUTING.md]:CONTRIBUTING.md
[LICENSE.md]:LICENSE.md
