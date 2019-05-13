#!/bin/bash

ACTION=$1

case $ACTION in
  delete|2)
    helm del --purge prometheus && kubectl delete crd $(kubectl get crd|grep -v NAME|awk '{print $1}')
    ;;

  install|1)
    read -p "grafana domain: " DOMAIN_G
    read -p "grafana admin password: " PASSWD
    read -p "prometheus domain: " DOMAIN_P
    read -p "pagerduty api key: " PAGERDUTY_KEY
    read -p "ip whitelist (ex: 0.0.0.0/32,1.1.1.1/32): " WHITELIST
    sed -i -e "/whitelist-source-range/d" -e "/annotations/a \ \ \ \ nginx.ingress.kubernetes.io/whitelist-source-range: ${WHITELIST}" templates/custom/ingress.yaml
    helm install --namespace monitoring --name prometheus ../prometheus --set \
    domain_grafana=${DOMAIN_G},domain_prometheus=${DOMAIN_P},pagerduty.key=${PAGERDUTY_KEY},grafana.adminPassword=${PASSWD}
    ;;
esac
