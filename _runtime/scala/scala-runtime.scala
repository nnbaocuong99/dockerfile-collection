// Runtime.scala

import scala.util.Properties

object Runtime {
  def main(args: Array[String]): Unit = {
    println("Scala Runtime Environment")
    println(s"Scala version: ${util.Properties.versionNumberString}")
    println(s"Java version: ${Properties.javaVersion}")
    println(s"Current working directory: ${System.getProperty("user.dir")}")
    println(s"Operating system: ${Properties.osName}")

    // Add your application logic here
    // For example:
    // App.start()
  }
}
