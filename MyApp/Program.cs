using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.Loader;
using MyLib;

Console.WriteLine(new Greeter().Greet("World"));

public static class AppRuntimeInitializer
{
    [ModuleInitializer]
    public static void Init()
    {
        AppDomain.CurrentDomain.AssemblyResolve += (sender, args) =>
        {
            // Check if the requested assembly is the one you want to load first
            if (args.Name.StartsWith("MyLib"))
            {
                // Load the dependency assembly
                return Assembly.LoadFrom("/Users/akhilesh/MyDevArea/dncoreapps/HorizontalUpgrade/MyLib/bin/Debug/net8.0/MyLib.dll");
            }

            // Return null if the assembly is not found
            return null;
        };

        AssemblyLoadContext.Default.LoadFromAssemblyPath("/Users/akhilesh/MyDevArea/dncoreapps/HorizontalUpgrade/MyLib/bin/Debug/net8.0/MyLib.dll");
    }
}