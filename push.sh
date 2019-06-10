#!/bin/bash

docker login
docker tag fastqc hisplan/fastqc:0.11.8
docker push hisplan/fastqc:0.11.8
