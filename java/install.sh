JAVA_VERSION=17
MAVEN_VERSION=3.8.4
GRADLE_VERSION=7.4

# Install OpenJDK
sudo apt-get install openjdk-${JAVA_VERSION}-jdk-headless -y

# Install Maven
curl -sL https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | sudo tar -C /usr/local -xvz

# Install Gradle
sudo curl -o /opt/gradle -sL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
sudo unzip -d /usr/local /opt/gradle
sudo rm -rf /opt/gradle

# Set PATH
export PATH=/usr/local/apache-maven-${MAVEN_VERSION}/bin:/usr/local/gradle-${GRADLE_VERSION}/bin:${PATH}