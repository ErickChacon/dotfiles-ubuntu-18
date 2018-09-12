#!/bin/bash

if [[ $HOSTNAME == "chaconmo-ThinkPad-L470-W10DG" ]]; then
  echo "Working at Lancaster University!"
elif [[ $HOSTNAME == "chaconmo-Precision-5510" ]]; then
  echo "Working at home!"
fi

# Terminal
cp ~/.bashrc .bashrc
cp ~/.bash_profile .bash_profile
cp ~/.bash_it/aliases/custom.aliases.bash custom.aliases.bash

# Unison
cp ~/.unison/default.prf default.prf
