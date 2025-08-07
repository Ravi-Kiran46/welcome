<style>
  h2 {
    color: #0c4b33;
    background-color: #e0f7f1;
    padding: 12px;
    border-left: 6px solid #0c4b33;
    font-family: Arial, sans-serif;
    margin: 20px 0;
    border-radius: 5px;
    white-space: pre-line; /* preserves line breaks */
  }
</style>
<form action="action_page.php">
  <div class="container">
    <h1>New user Register for DevOps Learning</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
     
    <label for="Name"><b>Enter Your Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>
    <br>
    
    <label for="mobile"><b>Enter Your Mobile</b></label>
    <input type="text" placeholder="Enter moible number" name="mobile" id="mobile" required>
    <br>

    <label for="email"><b>Enter Your Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" id="email" required>
    <br>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
    <br>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
    <hr>
    <br>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    <br>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  <div class="container signin">
    <br>
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
  <br>
  <h2>Hello !!</h2>
   <h2>made changes as per the requirement to automate the build and deploy the application into tomcat</h2>
   <h2>***** Jenkins will build the code and automatically it create a docker container</h2>
   <br>
   <h2>Jenkins will build the code and it will create a new war file and this war file should copy into ansible server and it should create an image and that image should get update onto dockerHub - automatically </h2>
   <h2>we are trying to copy artifacts from Jenkins to the Ansible server, then we should select the Ansible server in the "Send build artifacts over SSH" section — not the Docker host.
 

   <h2>complete flow - what's happening by doing this</h2>
   <br>
   <br>
   <h2>Jenkins Workflow (CI-CD)

1->Code Checkout
   Jenkins pulls the latest source code from GitHub

2->Build WAR using Maven
   Jenkins runs mvn clean package.
   This compiles the code and generates a .war file

3->Jenkins uses a plugin for Post-Build Action 
   Plugin: "Send build artifacts over SSH"
   here
   in Exec command, we are giving these cmds
   ansible-playbook /opt/docker-folder/catdotcom.yml;
   sleep 10;
   ansible-playbook /opt/docker-folder/deploy_catdotcom.yml
 
Next 
On Ansible Server

catdotcom.yml

FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps
-----------------------------------------------------------------------
🔹 FROM tomcat:latest
-->This tells Docker to use the official Tomcat image (latest version) as the base image.
-->Tomcat is a web server that runs Java .war applications.

🔹 RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
-->This copies the default webapps (like the manager, host-manager, etc.) from the backup directory (webapps.dist) into the live directory (webapps).
-->Sometimes, the Tomcat base image clears the webapps folder, so this command restores the default apps unless you are replacing them.

🔹 COPY ./*.war /usr/local/tomcat/webapps
-->This copies your .war file (like catdotcom.war) from your local directory (build context) into Tomcat’s deployment directory inside the image.
-->Tomcat auto-deploys .war files placed in /usr/local/tomcat/webapps.


✅ What Happens When You Run This Dockerfile?
	-->A new Docker image is created based on Tomcat.
	-->Your .war file is packaged into the image.
	-->When you run a container from this image, Tomcat will start and automatically deploy your app.

</h2>
<br>
<h2>Catdotcom-App CI Job Flow



-->Developer Stage
  	edit the code
	Commit and push the changes


-->Jenkins CI Stage
  	Jenkins pulls the latest code from GitHub
	Runs Maven to compile & package the app
	Generates a .war file.

-->Post-Build Actions
  	Plugin: Send build artifacts over SSH
	Target: Ansible server
	Exec command in Jenkins:
	ansible-playbook /opt/docker-folder/create_image_catdotcomapp.yml;

-->On Ansible Server
  	Builds a new Docker image from the WAR
	Pushes it to Docker Hub
	Exec command in Jenkins - recent build</h2>
<br>
<h2>disabled all the builds and created a CatDotCom_CI_job - working on this for a stable build </h2>

	   <h1> Thankyou, Happy Learning </h1>

  
</form>
