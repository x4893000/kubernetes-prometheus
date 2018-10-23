# Kubernetes Setup for Prometheus and Grafana

## Pre-requirement

You have to do things as above before deploy
```bash
kubectl label node <k8s-node-name> prometheus=prometheus-core
kubectl label node <k8s-node-name> grafana=grafana-core
ssh <k8s-node-name>
mkdir -p /opt/kubernetes-prometheus/prometheus
mkdir -p /opt/kubernetes-prometheus/grafana
```

## Quick start

To quickly start all the things just do this:
```bash
kubectl create -f manifest-all.yml
```

This will create the namespace `monitoring` and bring up all components in there.

To shut down all components again you can just delete that namespace:
```bash
kubectl delete namespace monitoring
```

## Configuration

If you want to configure this project , follow the step as below:
```bash
Config file -> change config/
K8S related -> change manifest/
sh build.sh
kubectl apply -f manifest-all.yml
```

## Default Dashboards

If you want to re-import the default dashboards from this setup run this job:
```bash
kubectl apply --filename ./manifests/grafana/grafana-import-dashboards-job.yaml
```

In case the job already exists from an earlier run, delete it before:
```bash
kubectl --namespace monitoring delete job grafana-import-dashboards
```


## More Dashboards

See grafana.net for some example [dashboards](https://grafana.net/dashboards) and [plugins](https://grafana.net/plugins).

- Configure [Prometheus](https://grafana.net/plugins/prometheus) data source for Grafana.<br/>
`Grafana UI / Data Sources / Add data source`
  - `Name`: `prometheus`
  - `Type`: `Prometheus`
  - `Url`: `http://prometheus:9090`
  - `Add`

- Import [Prometheus Stats](https://grafana.net/dashboards/2):<br/>
  `Grafana UI / Dashboards / Import`
  - `Grafana.net Dashboard`: `https://grafana.net/dashboards/2`
  - `Load`
  - `Prometheus`: `prometheus`
  - `Save & Open`

- Import [Kubernetes cluster monitoring](https://grafana.net/dashboards/162):<br/>
  `Grafana UI / Dashboards / Import`
  - `Grafana.net Dashboard`: `https://grafana.net/dashboards/162`
  - `Load`
  - `Prometheus`: `prometheus`
  - `Save & Open`

## GCPUG & JCCONF 2018 PPT Reference


https://drive.google.com/file/d/1G7R9_lNMxaZL8piojWltAXDZapgc0dYi/view?usp=sharing


## Credit

Alertmanager configs and integration in this repository was heavily inspired by the implementation in [kayrus/prometheus-kubernetes](https://github.com/kayrus/prometheus-kubernetes).
