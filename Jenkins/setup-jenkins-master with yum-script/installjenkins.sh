#!/bin/bash
#if you login as root, omit the sudo commands below
#because i like a clear screen
clear

#Run as root user
if [ "$(whoami)" != 'root' ]; then
 echo "You must be root to run this script!"
 exit 1
else
  echo "Starting.."
fi

#Install the JDK dependency. Jenkins is written in Java so this is a requirement.
yum -y install java-1.8.0-openjdk-devel

#Get the repository from Jenkins' official URL
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo

#Import the key from RedHat
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#Installing Jenkins..
yum install jenkins -y

# This command will automatically start Jenkins whenever your system boots
systemctl enable jenkins

#Start the Jenkins service
systemctl restart jenkins

sleep 10

echo "Installation complete!"

echo "Here is your initial Jenkins password: `cat /var/lib/jenkins/secrets/initialAdminPassword`"
