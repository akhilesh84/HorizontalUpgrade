using System;
using System.Reflection;

namespace MyLib;

public class Greeter
{
    public string Greet(string name) => $"{Assembly.GetExecutingAssembly().GetName().Version} : Hello, {name}! from App library..";
}
