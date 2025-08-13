# Licensed to The Apereo Foundation under one or more contributor license
# agreements. See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.
#
# The Apereo Foundation licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at:
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.

# FROM tomcat:9-jre11
# FROM tomcat:9.0.106-jdk21-temurin-noble
FROM tomcat:9.0.106-jre21-temurin-noble

# Define the download URL as an argument
# ARG DOWNLOAD_URL=https://github.com/UniTime/unitime/releases/download/v4.8.204/unitime-4.8_bld204.zip
ARG DOWNLOAD_URL=https://drive.usercontent.google.com/download?id=12BJqDgM05KNSFQleu3BGm8T9lVAsR94p&export=download&confirm=t

# Install necessary tools
RUN apt-get update && apt-get install -y wget unzip

ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.31/mysql-connector-j-8.0.31.jar /usr/local/tomcat/lib

# Use the build argument to download the zip file
# RUN wget -O /tmp/app.zip ${DOWNLOAD_URL}
RUN wget -O /tmp/UniTime.war ${DOWNLOAD_URL}

# Unzip the file
# RUN unzip /tmp/app.zip -d /tmp

# Move and rename the WAR file from the sub-folder to the webapps directory
# RUN mv /tmp/web/UniTime.war /usr/local/tomcat/webapps/ROOT.war
RUN mv /tmp/UniTime.war /usr/local/tomcat/webapps/ROOT.war

# Clean up
# RUN rm /tmp/app.zip && rm -rf /tmp/*
RUN rm -rf /tmp/*
