# Common Lisp Dockerfile Template

FROM clfoundation/sbcl:latest

WORKDIR /app

# Install Quicklisp
RUN sbcl --load "/usr/local/share/quicklisp/quicklisp.lisp" \
         --eval '(quicklisp-quickstart:install)' \
         --eval '(ql:add-to-init-file)' \
         --quit

# Copy source files
COPY . .

# Build the application
RUN sbcl --load "myapp.asd" \
         --eval '(ql:quickload :myapp)' \
         --eval '(sb-ext:save-lisp-and-die "myapp" :toplevel (function myapp:main) :executable t)' \
         --quit

# Expose port (if your application uses network)
EXPOSE 8080

# Run the application
CMD ["./myapp"]

# Optional: Add healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

# Optional: Add volume for persistent data
# VOLUME ["/app/data"]

# Optional: Use a non-root user
# RUN useradd -ms /bin/bash appuser
# USER appuser
