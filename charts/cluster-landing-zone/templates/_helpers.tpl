{{/*
Create the namespace name:
ucb-<project.code>-<namespace.name>

Rules:
- project.code must be exactly 4 characters
- namespace.name can not be empty
*/}}
{{- define "cluster-landing-zone.namespace" -}}
{{- $projectCode := required "project.code is required" .Values.project.code | lower | trim -}}
{{- $namespaceName := required "ClusterLandingZone.name is required" .Values.ClusterLandingZone.name | lower | trim -}}

{{- if ne (len $projectCode) 4 -}}
{{- fail "project.code must be exactly 4 characters" -}}
{{- end -}}

{{- if eq $namespaceName "" -}}
{{- fail "namespace.name must not be empty" -}}
{{- end -}}

{{- $fullName := printf "ucb-%s-%s" $projectCode $namespaceName -}}
{{- $fullName | replace "_" "-" | trunc 63 | trimSuffix "-" -}}
{{- end -}}