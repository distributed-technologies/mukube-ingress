#!/bin/bash
while :; do
  sleep 100
  ip=$(kubectl get services ingress-mukube-ingress-loadbalancer -n ingress --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
  if [ ! -z "$ip" ]
  then
    break
  fi
done