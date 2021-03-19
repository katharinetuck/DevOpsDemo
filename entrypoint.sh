#!/bin/bash
ls -alh ./chron_output/  || true
python ./cron_job.py
ls -alh ./chron_output/  || true