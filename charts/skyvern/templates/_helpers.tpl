{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "skyvern.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "skyvern.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "skyvern.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "skyvern.labels" -}}
helm.sh/chart: {{ include "skyvern.chart" . }}
{{ include "skyvern.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "skyvern.selectorLabels" -}}
app.kubernetes.io/name: {{ include "skyvern.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create postgresql name
*/}}
{{- define "skyvern.postgresql.fullname" -}}
{{- printf "%s-postgresql" (include "skyvern.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
UI name
*/}}
{{- define "skyvern.ui.name" -}}
{{- printf "%s-ui" (include "skyvern.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create skyvern UI full name
*/}}
{{- define "skyvern.ui.fullname" -}}
{{- printf "%s-ui" (include "skyvern.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
ARTIFACT name
*/}}
{{- define "skyvern.artifact.name" -}}
{{- printf "%s-artifact" (include "skyvern.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create skyvern ARTIFACT full name
*/}}
{{- define "skyvern.artifact.fullname" -}}
{{- printf "%s-artifact" (include "skyvern.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
