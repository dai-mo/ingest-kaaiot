import Dependencies._
import Common._
import com.typesafe.sbt.GitPlugin.autoImport._
import sbtbuildinfo.BuildInfoPlugin.autoImport._
import sbtrelease.ReleasePlugin.autoImport._
import sbtrelease._

val projectName = "org.dcs.kaaiot.parent"

lazy val dcskaaiot = (project in file(".")).
  settings(commonSettings: _*).
  settings(
    name := projectName
  ).aggregate( kaaiot, kaaiotClient)

lazy val kaaProjectName = "org.dcs.iot.kaa"
lazy val kaaProjectID   = "kaaiot"

lazy val kaaiot =
  BaseProject(kaaProjectID, kaaProjectName).
    settings(commonSettings: _*).
    settings(
      name := kaaProjectName,
      moduleName := kaaProjectName,
      libraryDependencies ++= kaaDependencies
    ).
    settings(resolvers += "Kaa IoT Repository" at "http://repository.kaaproject.org/repository/internal/").
    settings(resolvers += "Twitter Twttr Repository" at "http://maven.twttr.com/").
    settings(
      Seq
      (
        unmanagedSourceDirectories in Compile += baseDirectory.value / "generated" / "src" / "main" / "java",
        unmanagedSourceDirectories in Test += baseDirectory.value / "generated" / "src" / "test" / "java"
      )
    ).
    settings(test in assembly := {}).
    settings(publishArtifact in (Compile, assembly) := true).
    // FIXME: This creates a jar in the target dir. as,
    //        'name'-assembly-'version'.jar
    //        but publishes it as,
    //        'name'-'version'-assembly.jar
    settings(artifact in (Compile, assembly) ~= { art =>
      art.copy(`classifier` = Some("assembly"))
    }).
    settings(addArtifact(artifact in (Compile, assembly), assembly).settings: _*)

lazy val kaaClientProjectName = "org.dcs.iot.kaa.client"
lazy val kaaClientProjectID   = "kaaiot-client"

lazy val kaaiotClient =
  BaseProject(kaaClientProjectID , kaaClientProjectName).
    settings(commonSettings: _*).
    settings(
      name := kaaClientProjectName,
      moduleName := kaaClientProjectName,
      libraryDependencies ++= kaaClientDependencies
    )

// ------- Versioning , Release Section --------

// Build Info
buildInfoKeys := Seq[BuildInfoKey](name, version, scalaVersion, sbtVersion)
buildInfoPackage := projectName

// Git
showCurrentGitBranch

git.useGitDescribe := true

git.baseVersion := "0.0.0"

val VersionRegex = "v([0-9]+.[0-9]+.[0-9]+)-?(.*)?".r

git.gitTagToVersionNumber := {
  case VersionRegex(v,"SNAPSHOT") => Some(s"$v-SNAPSHOT")
  case VersionRegex(v,"") => Some(v)
  case VersionRegex(v,s) => Some(s"$v-$s-SNAPSHOT")
  case v => None
}

lazy val bumpVersion = settingKey[String]("Version to bump - should be one of \"None\", \"Major\", \"Patch\"")
bumpVersion := "None"

releaseVersion := {
  ver => bumpVersion.value.toLowerCase match {
    case "none" => Version(ver).
      map(_.withoutQualifier.string).
      getOrElse(versionFormatError)
    case "major" => Version(ver).
      map(_.withoutQualifier).
      map(_.bump(sbtrelease.Version.Bump.Major).string).
      getOrElse(versionFormatError)
    case "patch" => Version(ver).
      map(_.withoutQualifier).
      map(_.bump(sbtrelease.Version.Bump.Bugfix).string).
      getOrElse(versionFormatError)
    case _ => sys.error("Unknown bump version - should be one of \"None\", \"Major\", \"Patch\"")
  }
}

releaseVersionBump := sbtrelease.Version.Bump.Minor
