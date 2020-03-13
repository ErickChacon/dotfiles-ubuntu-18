#!/bin/bash

# level2=10-extract,20-clean,30-process,40-explore,50-model,60-summarise
# mkdir -p "50-scripts/{"${level2}"}"

mkdir -p {10-planning,20-literature,30-data,40-src,50-scripts,60-outputs,70-publication}
mkdir -p 30-data/{10-raw,20-cleaned,30-processed}
touch 40-src/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}.R
mkdir -p 50-scripts/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}
mkdir -p 60-outputs/{10-extract,20-clean,30-process,40-explore,50-model,60-summarise}

