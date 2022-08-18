<h1>CI/CD (GitHub Actions)</h1>
<p>
  CI/CD (continous Integration/Deployment) as the name implies is a Devops practice where code is delivered continously and frequently. This is made possible by various CI tools which allows you to build a pipeline of code delivery and deployment. In this Project we would be looking into Github actions which serves as a version control system and also CI tool. A simple React application will be deployed using Github actions.
</p>
<p>...</p>
<h2>Link to application: (http://18.205.155.173)</h2>
<h2>Another repository was used for this project: (https://github.com/Timi-T/nautilus-devops-cicd)</h2>
<p>...</p>
<h1>Steps taken to setup the Github actions for deployment of a Simple React application to an AWS instance</h1>
<ul>
  <li>
    <h3>Firstly the Instance to host the application is created and provisioned with the nesessary software which include nginx and node</h3>
    <p>The entire process of setting up the infrastructure and provisioning was automated using Terraforma and ansible in a shell script</p>
    <p>Link to Terraform manifest: (https://github.com/Timi-T/nautilus-devops/blob/main/0x07-week/cicd-infra.tf)</p>
    <p>Link to Ansible playbook: (https://github.com/Timi-T/nautilus-devops/blob/main/0x07-week/cicd-provision.yml)</p>
    <p>Link to shell script for deployment: (https://github.com/Timi-T/nautilus-devops/blob/main/0x07-week/deploy.sh)</p>
  </li>
  <li>
    <h3>Next the Github actions was setup for the project</h3>
    <p>The action runner was setup on the aws instance manually following the steps provided on Github.</p>
    <p>Then the workflow for the project was created and pushed to github</p>
    <p>Link to workflow file: (https://github.com/Timi-T/nautilus-devops/blob/main/0x07-week/actions.yml)</p>
  </li>
  <li>
    <p>Lastly, Nginx was configured manually and the react application was started as a background process.</p>
    <p>Link to Nginx config file: (https://github.com/Timi-T/nautilus-devops/blob/main/0x07-week/config)</p>
  </li>
</ul>
