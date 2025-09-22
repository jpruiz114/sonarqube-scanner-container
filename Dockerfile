FROM sonarqube:community

# Switch to root user for package installation
USER root

# https://busybox.net/

RUN apt-get update && apt-get install -y curl unzip wget

RUN wget https://services.gradle.org/distributions/gradle-7.6-bin.zip
RUN unzip -d /opt/gradle gradle-7.6-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.6
ENV PATH=$PATH:$GRADLE_HOME/bin

# https://binaries.sonarsource.com/?prefix=Distribution/sonar-scanner-cli/

RUN mkdir /downloads/sonarqube -p \
 && cd /downloads/sonarqube \
 && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-6.0.0.4432-linux.zip \
 && unzip sonar-scanner-cli-6.0.0.4432-linux.zip \
 && mv sonar-scanner-6.0.0.4432-linux /opt/sonar-scanner \
 && sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /opt/sonar-scanner/bin/sonar-scanner

ENV PATH="$PATH:/opt/sonar-scanner/bin"

# Memory configuration for SonarQube and Elasticsearch
ENV SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true
ENV ES_JAVA_OPTS="-Xms1g -Xmx3g"
ENV SONAR_JAVA_OPTS="-Xms512m -Xmx1g"

# Switch back to sonarqube user for security
USER sonarqube
