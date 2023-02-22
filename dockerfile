FROM sonarqube:9.1.0-community

# https://busybox.net/

RUN apk add curl gcompat gradle libstdc++ unzip

# https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/

RUN mkdir /downloads/sonarqube -p \
 && cd /downloads/sonarqube \
 && wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip \
 && unzip sonar-scanner-cli-4.6.2.2472-linux.zip \
 && mv sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner \
 && sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /opt/sonar-scanner/bin/sonar-scanner

ENV PATH "$PATH:/opt/sonar-scanner/bin"

# https://newbedev.com/how-do-i-add-a-user-when-i-m-using-alpine-as-a-base-image

# Create a group and user
#RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Tell docker that all future commands should run as the appuser user
#USER appuser
