using System.Runtime.Loader;

// Note: This needs to be in the global namespace. Do not nest inside a namespace
internal class StartupHook
{
    public static void Initialize()
    {
        AssemblyLoadContext.Default.LoadFromAssemblyPath("/Users/akhilesh/MyDevArea/dncoreapps/HorizontalUpgrade/ImplAsm/MyLib.dll");
    }
}
