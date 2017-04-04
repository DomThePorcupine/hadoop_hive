# Pull the base ubuntu image
FROM ubuntu:16.04
# Install dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y default-jre default-jdk wget bzip2

# Install hadoop
RUN mkdir /hadoop
WORKDIR /hadoop
RUN wget http://www.trieuvan.com/apache/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz
RUN tar -xzf hadoop-2.7.3.tar.gz
RUN mv hadoop-2.7.3 /usr/local/hadoop

# Install hive
RUN wget http://apache.mirrors.hoobly.com/hive/hive-2.1.1/apache-hive-2.1.1-bin.tar.gz
RUN tar -xzf apache-hive-2.1.1-bin.tar.gz
RUN mv apache-hive-2.1.1-bin /usr/local/hive

# Set hadoop environment variables
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64/
ENV HADOOP_CLASSPATH /usr/lib/jvm/java-1.8.0-openjdk-amd64/lib/tools.jar
ENV HIVE_HOME /usr/local/hive/
# Add hadoop to our path
ENV PATH /usr/local/hadoop/bin:/usr/local/hive/bin:$PATH

# Make the directory we will work in
RUN mkdir /hadoop/projects
WORKDIR /hadoop/projects

CMD ["/bin/bash"]
