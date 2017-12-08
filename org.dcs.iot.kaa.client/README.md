
<!-- TOC -->

- [Alambeek KaaIoT ClientProject](#alambeek-kaaiot-clientproject)
    - [Features](#features)
    - [Configuration](#configuration)
- [Usage](#usage)
    - [Initialise KaaIoT Platform](#initialise-kaaiot-platform)
    - [IoT Device Simulation](#iot-device-simulation)
        - [Heartbeat Demo](#heartbeat-demo)
- [Main Dependencies](#main-dependencies)
- [Releases](#releases)

<!-- /TOC -->


# Alambeek KaaIoT ClientProject
This library provides functionality to connect to the REST API of the [KaaIoT Platform].
 
## Features
This project provides the following features,
 * an initialiser which perfoms the initial setup of the KaaIoT platform
 * a REST API client library to connect to the KaaIoT platform which can be used by other Alambeek components
 * an IoT device simulator which sends data to the KaaIoT instance

## Configuration
This module / library requires the following configuration,
 * a file containing credentials for access to the KaaIoT platform's REST API. A sample credentials file is available at _src/test/resources/kaaCredentials.yaml_
 * a directory containing configuration to initialise the KaaIoT platform with the various users, applications and schema. A sample config directory is available at _src/test/resources/kaa-config_


# Usage
## Initialise KaaIoT Platform
The automated setup of a blank KaaIoT Platform includes,
* creation of DCS Superuser
* creation of DCS Tenant user
* creation of DCS Tenant Admin and Tenant Dev users
* creation of [sample](http://kaaproject.github.io/kaa/docs/v0.10.0/Programming-guide/Your-first-Kaa-application/) application along with corresponding log / configuration schema as well as log appender
* creation of a Heartbeat Monitor application with no log appender  


To execute the setup run,  
`sbt -DkaaCredentials=</path/to/DCS Kaa Credentials File> -DkaaConfigDir=</path/to/DCS Kaa Config Directory> "kaaiot-client/runMain org.dcs.iot.kaa.KaaIoTInitialiser"`  
in the **root** directory of the _dcs_kaaiot_ project.

## IoT Device Simulation
### Heartbeat Demo
This client is inspired by the [Data Collection](http://kaaproject.github.io/kaa/docs/v0.10.0/Programming-guide/Your-first-Kaa-application/) application.

To run this client,
 * Login to the KaaIoT web application using dev user credentials (lookup the credential file used above)
 * Add an SDK Profile to the application 'Heartbeat Monitor' and generate / download the SDK as described [here](http://kaaproject.github.io/kaa/docs/v0.10.0/Programming-guide/Your-first-Kaa-application/#generate-sdk). :warning: This step needs to be performed whenever the KaaioT platform is initialised.
 * Create _lib_ directory in this project and copy the downloaded jar to this directory
 * Copy the _HeartbeatMonitorClient.scala_ file to the _src/main/scala/org/dcs/iot/kaa/client_ directory
 * Execute `sbt "kaaiot-client/runMain org.dcs.iot.kaa.client.HeartbeatMonitorClient"` in the **root** directory of the _dcs_kaaiot_ project.

# Main Dependencies
The main dependencies of this project include,
 * [Nifi Site-to-Site] client 
 * dcs_commons


# Releases
Include this library to your project by adding the following dependency to the sbt build,  
`"org.dcs" % "org.dcs.iot.kaa.client" % "0.1.0"`


[KaaIoT Platform]:https://www.kaaproject.org/
[org.dcs.iot.kaa]:org.dcs.iot.kaa/README.md
[org.dcs.iot.kaa.client]:org.dcs.iot.kaa.client/README.md

[kaaCredentials]: org.dcs.iot.kaa.client/src/test/resources/kaaCredentials.yaml
[kaaConfig]: org.dcs.iot.kaa.client/src/test/resources/kaa-config

[Nifi Site-to-Site]:https://nifi.apache.org/docs/nifi-docs/html/user-guide.html#site-to-site




