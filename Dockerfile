# Используем базовый образ с поддержкой Docker внутри Docker (DinD)
FROM docker:20.10.22-dind

# Устанавливаем Java и wget
RUN apk --update --no-cache add openjdk17-jre wget ttf-dejavu git

# Устанавливаем Jenkins
ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_URL https://get.jenkins.io/war-stable/latest/jenkins.war

# Создаем директорию для Jenkins
RUN mkdir -p $JENKINS_HOME

# Скачиваем Jenkins WAR файл
RUN wget -O $JENKINS_HOME/jenkins.war $JENKINS_URL

# Запускаем Jenkins
CMD ["java", "-jar", "/var/jenkins_home/jenkins.war"]

# Определяем порт, на котором будет работать Jenkins
EXPOSE 8080 50000
