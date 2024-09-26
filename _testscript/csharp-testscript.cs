// TestScript.cs

using Microsoft.VisualStudio.TestTools.UnitTesting;

[TestClass]
public class TestScript
{
    [TestMethod]
    public void TestAddition()
    {
        Assert.AreEqual(2, 1 + 1);
    }

    [TestMethod]
    public void TestSubtraction()
    {
        Assert.AreEqual(2, 5 - 3);
    }

    [TestMethod]
    public void TestMultiplication()
    {
        Assert.AreEqual(6, 2 * 3);
    }

    [TestMethod]
    public void TestDivision()
    {
        Assert.AreEqual(3, 6 / 2);
    }
}

// To run tests, use Visual Studio Test Explorer or dotnet test command
// Make sure to install MSTest.TestFramework NuGet package
