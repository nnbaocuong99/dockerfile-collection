// Tests.fs

module Tests

open Xunit

let add a b = a + b

[<Fact>]
let ``Adding 1 and 1 equals 2`` () =
    Assert.Equal(2, add 1 1)

[<Fact>]
let ``Adding -1 and 1 equals 0`` () =
    Assert.Equal(0, add -1 1)

[<Fact>]
let ``Adding 0 and 0 equals 0`` () =
    Assert.Equal(0, add 0 0)

// Run tests using: dotnet test
// Make sure to set up your project with xUnit
