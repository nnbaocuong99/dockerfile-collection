// Program.cs

using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("C# Runtime Environment");
        Console.WriteLine($"C# version: {Environment.Version}");
        Console.WriteLine($"Current working directory: {Directory.GetCurrentDirectory()}");
        Console.WriteLine($"Operating system: {Environment.OSVersion}");

        // Add your application logic here
        // For example:
        // App.Start();
    }
}
