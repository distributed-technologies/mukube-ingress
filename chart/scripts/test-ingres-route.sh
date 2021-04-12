apt-get update > /dev/null 2>&1
apt-get install -y curl > /dev/null 2>&1

timeout 5m bash -c /scripts/check-for-ip.sh

echo "$(kubectl get services ingress-mukube-ingress-loadbalancer -n ingress --output jsonpath='{.status.loadBalancer.ingress[0].ip}')    test-app" >> /etc/hosts
curl -f http://test-app/
