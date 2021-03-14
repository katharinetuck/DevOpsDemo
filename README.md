# DevOpsDemo 

Contains a python script that accepts an input file. The script can call out to the Star Wars public API and retrieve information requested that is specificed in the input file. The output is then saved as json to a created directed. The entire script is packaged with a Dockerfile meant to be spun up as a cron job.

Also included is the relevant terraform needed to spinup an AWS EC2 linux 2 server with an elastic IP and .ssh access.

Installation Requirements:

Python 3.7 or later
Python libraries specificed in the requirements.txt
Terraform v0.14.7 +
Docker desktop
AWS CLI
