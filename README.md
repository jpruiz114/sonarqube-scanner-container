# SonarQube Scanner Container

Docker container with SonarQube 9.9.8 Community Edition, Gradle 7.6, and SonarQube Scanner CLI 6.0.0 for code analysis. All project management and scanning is handled by the [SonarQube Project Scanner](https://github.com/jpruiz114/sonarqube-project-scanner) Java application.

## Build

```bash
docker build -t jpruiz114/sonarqube-with-sonarscanner .
```

## Run

```bash
# Default port
docker run -d --name sonarqube-scanner \
  -p 9000:9000 \
  jpruiz114/sonarqube-with-sonarscanner

# Alternative port if 9000 is in use
docker run -d --name sonarqube-scanner \
  -p 9001:9000 \
  jpruiz114/sonarqube-with-sonarscanner
```

**Access**: `http://localhost:9000` (or `http://localhost:9001`)  
**Wait**: 30-60 seconds for startup

## Publish to Docker Hub

```bash
# Tag and push latest
docker tag jpruiz114/sonarqube-with-sonarscanner jpruiz114/sonarqube-with-sonarscanner:latest
docker push jpruiz114/sonarqube-with-sonarscanner:latest
```

## Usage

Use the [SonarQube Project Scanner](https://github.com/jpruiz114/sonarqube-project-scanner) Java application to:
- Create projects and generate authentication tokens
- Scan your code and generate reports  
- Export analysis results to CSV files

The Java application handles all interaction with this container via SonarQube's REST API.