FROM sonarqube:9.1.0-community

# https://busybox.net/

RUN apk add curl gcompat libstdc++ unzip

RUN wget https://services.gradle.org/distributions/gradle-7.6-bin.zip
RUN unzip -d /opt/gradle gradle-7.6-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.6
ENV PATH=$PATH:$GRADLE_HOME/bin

# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/

RUN mkdir /downloads/sonarqube -p \
 && cd /downloads/sonarqube \
 && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip \
 && unzip sonar-scanner-cli-4.6.2.2472-linux.zip \
 && mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner \
 && sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /opt/sonar-scanner/bin/sonar-scanner

ENV PATH "$PATH:/opt/sonar-scanner/bin"
