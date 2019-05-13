# Prometheus Operator and custom settings

##Folk from
* [https://github.com/helm/charts/tree/master/stable/prometheus-operator](https://github.com/helm/charts/tree/master/stable/prometheus-operator)

## Pre-requirement
* 1. Existing Kubernetes Cluster
* 2. [Install Helm](https://helm.sh/docs/using_helm/)

## Custom Settings
- 1. Import Custom Dashboard
  - Put you custom dashboard json in templates/custom/import/configmap.yaml , it will auto-import when grafana been installed
- 2. Create Notification Channel
  - This package will create PagerDuty notification channel as default , then all alerts will send to this channel , you can change to others by editing templates/custom/import/job.yaml


## Install
```
./setup.sh install
```

## Delete
```
./setup.sh delete
```
