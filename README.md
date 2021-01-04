# Cybersecurity Bootcamp Project I
## Automated ELK Stack Deployment

This is the first project in the U of T School of Continuing Studies
Cyber Security Bootcamp.

The files in this repository we used to configure the network depicted below.

![Network Diagram](Diagrams/networkDiagram.png)

These files have been tested and used to generate a live ELK deployment on
Azure. They can be used to either recreate the entire deployment pictured above.
Alternatively, select portions of the YAML file may be used to install only
certain pieces of it such as [Filebeat](Ansible/filebeat/filebeat-playbook.yml)

This document contains the following details:

* Description of the topology
* Access policies
* ELK configuration
  * Beats in use
  * Machines being monitored
* How to use the Ansible build

### Description of the topology

The main purpose of this network is to expose a load-balanced and monitored
instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in
addition to restricting traffic to the network.

Load balancers help protect against DDoS attacks. Having a jump box is also
effective in this case to help protect against direct remote login to the servers
that are hosting the web applications.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for
changes to the log data and system metrics.

The configuration details of each machine may be found below.

| Name                 | Function | IP Address | Operating System |
|----------------------|----------|------------|------------------|
| Jump-Box-Provisioner | Gateway  | 10.0.0.7   | Ubuntu 18.04     |
| Web-1                | DVWA     | 10.0.0.5   | Ubuntu 18.04     |
| Web-2                | DVWA     | 10.0.0.6   | Ubuntu 18.04     |
| Web-3                | DVWA     | 10.0.0.8   | Ubuntu 18.04     |
| ELK-Server           | ELK      | 10.1.0.4   | Ubuntu 18.04     |

### ELK Configuration

Ansible was used to automate the configuration of the ELK machine. No
configuration was performed manually which is advantageous because this ensures
that all configurations are identical, and if a problem was found, it only needs
to be fixed in one place.

The playbook implements the following tasks:

* Install the docker.io package
* Install the python3-pip package and install the python docker module
* Increase the virtual memory
* Download and launch the ELK docker container

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

* 10.0.0.5
* 10.0.0.6
* 10.0.0.8

The following Beats have been installed on these machines:

* Filebeat
* Metricbeat

These Beats allows us to collect the following information from each machine:

Filebeat allows us to collect log files and other locations or files that we
specify. This can be used to track any unusual activity happening in the VMs.
Metricbeat allowes us to collect operating system metrics such as cpu and memory
usage. This is helpful to know the health of the VMs.

### Using the Playbook

In order to use the playbook, you will need to have an Ansble control node
already configured. This is configured on the jump box in this setup. Assuming
you have such a control node provisioned, follow the steps below:

* SSH into the control node
* Copy the [Filebeat](Ansible/filebeat/filebeat-playbook.yml) and
  [Metricbeat](Ansible/metricbeat/metricbeat-playbook.yml) files to your node
* Update the hosts file `/etc/ansible/hosts` to specify which VMs you want to
  run the playbooks on
* Update the Filebeat and Metricbeat config files to point to your ELK server's
  IP Address
* Run the playbook and navigate to the ELK server to check that the installation
  was successful
  * For Filebeat, run `ansible-playbook filebeat-playbook.yml`
  * Similarly, for Metricbeat, run `ansible-playbook metric-beat-playbook.yml`
