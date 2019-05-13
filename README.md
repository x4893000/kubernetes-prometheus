# Prometheus Operator and custom settings

##Folk from
* [https://github.com/helm/charts/tree/master/stable/prometheus-operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator)

## Pre-requirement
- Existing Kubernetes Cluster
- [Install Helm](https://helm.sh/docs/using_helm/)
- [Nginx Ingress Controller](https://github.com/kubernetes/ingress-nginx)

## Custom Settings
- Import Custom Dashboard
  - Put you custom dashboard json in templates/custom/import/configmap.yaml , it will auto-import when grafana been installed
- Create Notification Channel
  - This package will create PagerDuty notification channel as default , then all alerts will send to this channel , you can change to others by editing templates/custom/import/job.yaml
- Expose Prometheus & Grafna UI by ingress , basic protected by nginx whitelist


## Install
```
./setup.sh install
```

## Delete
```
./setup.sh delete
```
