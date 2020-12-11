# How-To-Setup-Jenkins
Jenkins is NOT a software as a service (SaaS) -- at least not yet -- and has to run on a server.
This is a simple shell script to setup Jenkins on RedHat/CentOS. For Ubuntu systems, simply change the package manager from yum to apt-get.

Once you run the installjenkins.sh script few more things are needed to finish the setup:

 - Jenkins runs on port 8080. Ensure port 8080 is listening on your server. You can verify this with:

```
	netstat -tulnp | grep :8080
```
Paste your server's ip address to your browser followed by :8080. This should display the Jenkins UI.

<img width="1440" alt="screen shot 2018-08-27 at 11 32 09 pm" src="https://user-images.githubusercontent.com/30080956/44701015-11f35500-aa52-11e8-88f0-968502be3b02.png">

As instructed, go to the listed path and cat out the password, paste it on the UI

```
	cat /var/lib/jenkins/secrets/initialAdminPassword
```


Go through the basic setup, install the recommended plugins or whatever plugins you desire.

Jenkins setup is complete!

<img width="1440" alt="screen shot 2018-08-27 at 11 43 06 pm" src="https://user-images.githubusercontent.com/30080956/44701174-110ef300-aa53-11e8-822c-c3a32d44004d.png">

You are now on your way to creating a continuous integration pipeline :)

Sidenote:

How to pull down and run this script:

```
wget -O - https://raw.githubusercontent.com/lolsam/setup-jenkins/master/installjenkins.sh | bash -x
```
