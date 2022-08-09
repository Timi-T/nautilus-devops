<h1>Infrastructure as code (Terraform & Packer)</h1>
<ul>
  <li>
    <p>
      Infrastructure as code (IaC) is a term used to describe the process of provisioning and configuration of an IT infrastructure using configuration files.
      The configuration files generally includes line by line instructions to be carried out in order to have the whole infrastructure setup.
      This has greatly improved the efficiency of companies because now as opposed to manual configuration which would take hours or even days in some cases businesses can upscale and downscale using simple configuration files. This method goes as far as using cloud provider APIs to setup cloud infrastructures.
      Infrastructure as code manages the state of an infrastructure using the configuration file so that any change in the file updates the state of the said infrastructure.
    </p>
  </li>
  <li>
    <p>To launch an aws instance using Terraform</p>
    <ul>
      <li>Firstly, the cloud provider is declared (AWS) in this case.</li>
      <li>
        Next, I generated a secret key in my AWS account which would Authorize terraform to carry out operations on the account
      </li>
        Next, the resource was declared (asw_instance) in this case with the instance properties.
      <li>
        Next, run command "terraform init". This downloads the plugins for each provider that is declared.
        <img src="terra-init.png" />
      <li>
      <li>
        Next, run command "terraform plan". This parses the terraform manifest and gives an output of all changes to be made to the state of your infrastructure before the changes are applied.
        <img src="terra-plan.png" />
        (Full output of command -> https://github.com/Timi-T/nautilus-devops/blob/main/0x06-week/terra-plan.md)
      </li>
      <li>
        Finally, run command "terraform apply". This applies all the changes to the state of the infrastructure.
        <img src="terra-apply.png" />
      </li>
    </ul>
    <p>Below, we see the running instance "one-instance" on AWS platform</p>
    <img src="running-instance.png" />
    Terraform manifest 1: (https://github.com/Timi-T/nautilus-devops/blob/main/0x06-week/one-instance.tf)
  </li>
</ul>
