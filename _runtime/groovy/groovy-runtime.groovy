println "Groovy Runtime Environment"
println "Groovy version: ${GroovySystem.version}"
println "Current working directory: ${System.getProperty('user.dir')}"
println "Java version: ${System.getProperty('java.version')}"
println "Operating System: ${System.getProperty('os.name')}"

// Measure execution time
def startTime = System.currentTimeMillis()

// Add your application logic here
// For example:
// def app = new App()
// app.start()

def endTime = System.currentTimeMillis()
println "Execution time: ${endTime - startTime} ms"

// To run: groovy runtime.groovy
