{{/*
Nom de l'application
*/}}
{{- define "tinyauth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Nom complet de l'application
*/}}
{{- define "tinyauth.fullname" -}}
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
Nom du service account
*/}}
{{- define "tinyauth.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tinyauth.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Labels communs
*/}}
{{- define "tinyauth.labels" -}}
helm.sh/chart: {{ include "tinyauth.chart" . }}
{{ include "tinyauth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Nom du chart
*/}}
{{- define "tinyauth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels sélecteurs
*/}}
{{- define "tinyauth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tinyauth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Variables d'environnement
*/}}
{{- define "tinyauth.envVars" -}}
{{- range $key, $value := .Values.env }}
- name: {{ $key | upper }}
  value: {{ $value | quote }}
{{- end }}
{{- end }}
