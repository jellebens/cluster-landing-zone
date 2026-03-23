#!/usr/bin/env bash

VERSION=$1

helm package ./charts/cluster-landing-zone/

#helm registry login registry-1.docker.io -u jellebens

helm push cluster-landing-zone-$VERSION.tgz  oci://registry-1.docker.io/jellebens



rm *.tgz
