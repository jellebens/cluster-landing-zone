## Package the chart
```bash
   helm package ./charts/cluster-landing-zone/
```

## login to OCI registry
```bash
   helm registry login registry-1.docker.io -u YOUR_DOCKERHUB_USERNAME
```

## Push the image
helm push charts/cluster-landing-zone-0.1.0.tgz  oci://registry-1.docker.io/jellebens

