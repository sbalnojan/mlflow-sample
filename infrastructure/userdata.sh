#!/bin/bash
sudo yum update -y
sudo yum install python36 -y
sudo python3 -m pip install mlflow

mlflow server \
    --backend-store-uri ~/mnt/persistent-disk \
    --host 0.0.0.0
