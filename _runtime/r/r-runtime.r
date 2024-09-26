# RUNTIME file for R

# Set environment variables
Sys.setenv(APP_ENV=production)

# Main application logic
cat(R Runtime Environmentn)
cat(R version , R.version.string, n)
cat(Current working directory , getwd(), n)

# Add your application logic here
# For example
# source(my_app.R)
# run_app()
