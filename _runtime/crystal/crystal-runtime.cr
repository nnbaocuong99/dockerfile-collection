require "system"

puts "Crystal Runtime Environment"
puts "Crystal version: #{Crystal::VERSION}"
puts "Current working directory: #{Dir.current}"
puts "Operating System: #{System.os_name}"
puts "CPU Architecture: #{System.cpu_arch}"

# Measure execution time
start_time = Time.monotonic

# Add your application logic here
# For example:
# require "./app"
# App.start

end_time = Time.monotonic
puts "Execution time: #{(end_time - start_time).total_seconds} seconds"

# To compile: crystal build runtime.cr
# To run: ./runtime
