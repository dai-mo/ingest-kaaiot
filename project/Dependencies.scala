import sbt._

object Dependencies {
  lazy val scVersion = "2.11.7"

  // Versions

  lazy val dcsCommonsVersion      = "0.3.0"

  lazy val nifiVersion			      = "1.0.0-BETA"
  lazy val slf4jVersion			      = "1.7.12"

  lazy val logbackVersion         = "1.1.3"

  lazy val kaaVersion             = "0.10.1"

  lazy val mockitoVersion         = "1.10.19"
  lazy val scalaTestVersion       = "3.0.0"



  val dcsCommons      = "org.dcs"                          % "org.dcs.commons"                    % dcsCommonsVersion


  val logbackCore     = "ch.qos.logback"                   % "logback-core"                       % logbackVersion
  val logbackClassic  =	"ch.qos.logback"                   % "logback-classic"                    % logbackVersion

  val kaaLog          = "org.kaaproject.kaa.server.common" % "log-shared"                         % kaaVersion
  val kaaUtils        = "org.kaaproject.kaa.server.common" % "utils"                              % kaaVersion
  val nifiS2S         = "org.apache.nifi"                  % "nifi-site-to-site-client"           % nifiVersion

  val sl4japi         = "org.slf4j"                        % "slf4j-api"                          % slf4jVersion
  val log4josl4j      = "org.slf4j"                        % "log4j-over-slf4j"                   % slf4jVersion


  val mockitoCore     = "org.mockito"                      % "mockito-core"                       % mockitoVersion
  val mockitoAll      = "org.mockito"                      % "mockito-all"                        % mockitoVersion
  val scalaTest       = "org.scalatest"                    %% "scalatest"                         % scalaTestVersion


  val kaaDependencies = Seq(
    nifiS2S,
    kaaLog           % "provided",
    kaaUtils         % "provided",
    sl4japi          % "provided",
    log4josl4j       % "provided",

    logbackCore      % "provided",
    logbackClassic   % "provided",

    dcsCommons       % "test",
    mockitoCore      % "test",
    mockitoAll       % "test",
    scalaTest        % "test"
  )

  val kaaClientDependencies = Seq(

    logbackCore      ,
    logbackClassic   ,

    dcsCommons       ,

    mockitoCore      % "test",
    mockitoAll       % "test",
    scalaTest        % "test"
  )
}
