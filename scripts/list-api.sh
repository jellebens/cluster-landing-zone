#!/bin/bash
list=($(kubectl get --raw / | jq -r '.paths[] | select(. | startswith("/api"))')); 
for tgt in ${list[@]}; do
  aruyo=$(kubectl get --raw ${tgt} | jq .resources); 
  if [ "x${aruyo}" != "xnull" ]; then 
    echo; 
    echo "===${tgt}==="; 
    kubectl get --raw ${tgt} | jq -r ".resources[] | .name,.verbs"; 
  fi; 
done