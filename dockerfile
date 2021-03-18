#set base image to python3
FROM python:3.8 as build
#set working directory
WORKDIR ./star_wars_dev_ops

#load requirements
COPY requirements.txt requirements.txt
#install requirements
RUN pip install -r requirements.txt

COPY cron_job.py ./cron_job.py
COPY input.yaml ./input.yaml
COPY entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh


#run the chron_job
ENTRYPOINT [ "./entrypoint.sh" ]

