import os
import times

echo "Nim Runtime Environment"
echo "Nim version: ", NimVersion
echo "Current working directory: ", getCurrentDir()
echo "Operating System: ", hostOS
echo "CPU Architecture: ", hostCPU

# Measure execution time
let startTime = cpuTime()

# Add your application logic here
# For example:
# import app
# app.start()

let endTime = cpuTime()
echo "Execution time: ", endTime - startTime, " seconds"

# To compile: nim c -r runtime.nim
# To run: ./runtime
