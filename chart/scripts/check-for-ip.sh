#!/bin/bash
while :; do
  ip=$(kubectl get services ingress-mukube-ingress-loadbalancer -n ingress --output jsonpath='{.status.loadBalancer.ingress[0].ip}')
  if [ ! -z "$ip" ]
  then
    break
  fi
  sleep 10
done