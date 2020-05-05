#!/bin/bash

# level2=10-extract,20-clean,30-process,40-explore,50-model,60-summarise
# mkdir -p "50-scripts/{"${level2}"}"

mkdir -p {data,src,scripts,outputs,reports}
mkdir -p data/{raw,cleaned,processed}
touch src/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}.R
mkdir -p scripts/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}
mkdir -p outputs/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}
mkdir -p reports/{slides,paper}

touch data/{raw/.gitkeep,cleaned/.gitkeep,processed/.gitkeep}
touch \
    scripts/{10-extract/.gitkeep,20-clean/.gitkeep,30-process/.gitkeep,40-explore/.gitkeep,50-model/.gitkeep,60-summarise/.gitkeep}
touch \
    outputs/{10-extract/.gitkeep,20-clean/.gitkeep,30-process/.gitkeep,40-explore/.gitkeep,50-model/.gitkeep,60-summarise/.gitkeep}
touch reports/{slides/.gitkeep,paper/.gitkeep}
touch Makefile

