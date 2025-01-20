# Use an official Tomcat runtime as a base image
FROM tomcat:8.5

# Maintainer Information
MAINTAINER Your Name <your_email@example.com>

# Install necessary tools (optional)
RUN apt-get update && \
    apt-get install -y net-tools tree vim && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get purge

# Set Java options (if needed)
RUN echo "export JAVA_OPTS=\"-Dapp.env=production\"" > /usr/local/tomcat/bin/setenv.sh

# Copy your WAR file into the Tomcat webapps directory
COPY pkg/demo.war /usr/local/tomcat/webapps/demo.war

# Expose Tomcat's port (default: 8080)
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
