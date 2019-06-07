{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "nginx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nginx.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "nginx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "init.repository" -}}
{{- if .Values.imageInit.python.enabled -}}
{{- .Values.imageInit.python.repository -}}
{{- else -}}
{{- .Values.imageInit.alpine.repository -}}
{{- end -}}
{{- end -}}

{{- define "init.tag" -}}
{{- if .Values.imageInit.python.enabled -}}
{{- .Values.imageInit.python.tag -}}
{{- else -}}
{{- .Values.imageInit.alpine.tag -}}
{{- end -}}
{{- end -}}

{{- define "init.pullPolicy" -}}
{{- if .Values.imageInit.python.enabled -}}
{{- .Values.imageInit.python.pullPolicy -}}
{{- else -}}
{{- .Values.imageInit.alpine.pullPolicy -}}
{{- end -}}
{{- end -}}

{{- define "init.command" -}}
{{- if .Values.imageInit.python.enabled -}}
{{- .Values.imageInit.python.command }}
{{- else -}}
{{- .Values.imageInit.alpine.command }}
{{- end -}}
{{- end -}}

{{- define "init.args" -}}
{{- if .Values.imageInit.python.enabled -}}
{{- .Values.imageInit.python.args }}
{{- else -}}
{{- .Values.imageInit.alpine.args }}
{{- end -}}
{{- end -}}