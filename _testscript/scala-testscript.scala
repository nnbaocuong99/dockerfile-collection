// TestScript.scala

import org.scalatest.funsuite.AnyFunSuite

class TestScript extends AnyFunSuite {
  test("Addition") {
    assert(1 + 1 === 2)
  }

  test("Subtraction") {
    assert(5 - 3 === 2)
  }

  test("Multiplication") {
    assert(2 * 3 === 6)
  }

  test("Division") {
    assert(6 / 2 === 3)
  }
}

// Run tests using: sbt test
// Make sure to set up your build.sbt file with the ScalaTest dependency
// libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.10" % Test
