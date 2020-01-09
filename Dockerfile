FROM openjdk:latest

WORKDIR /home

RUN curl -sL https://rpm.nodesource.com/setup_13.x | bash -
RUN yum install unzip wget git nodejs -y
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip
RUN unzip sonar-scanner-cli-4.2.0.1873-linux.zip
RUN mv sonar-scanner-4.2.0.1873-linux/ sonarqube
RUN rm sonar-scanner-cli-4.2.0.1873-linux.zip

ADD entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]