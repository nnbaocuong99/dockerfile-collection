-- RUNTIME file for Lua

-- Set environment variables
os.setenv(APP_ENV, production)

-- Main application logic
print(Lua Runtime Environment)
print(Lua version  .. _VERSION)
print(Current working directory  .. io.popen(cd)read())

-- Add your application logic here
-- For example
-- require(my_app)
-- my_app.run()
