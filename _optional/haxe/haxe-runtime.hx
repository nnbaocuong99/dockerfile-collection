class Runtime {
    public static function main() {
        Sys.println("Haxe Runtime Environment");
        Sys.println("Haxe version: " + haxe.macro.Compiler.getDefine("haxe"));
        Sys.println("Current working directory: " + Sys.getCwd());
        Sys.println("Operating System: " + Sys.systemName());
        Sys.println("CPU Architecture: " + Sys.cpuArchitecture());

        // Measure execution time
        var startTime = Sys.time();

        // Add your application logic here
        // For example:
        // App.start();

        var endTime = Sys.time();
        Sys.println("Execution time: " + (endTime - startTime) + " seconds");
    }
}

// To compile: haxe -main Runtime -neko runtime.n
// To run: neko runtime.n
