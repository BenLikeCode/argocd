{{/*
Nom de l'application
*/}}
{{- define "stirlingpdf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Nom complet de l'application
*/}}
{{- define "stirlingpdf.fullname" -}}
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
{{- define "stirlingpdf.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "stirlingpdf.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Labels communs
*/}}
{{- define "stirlingpdf.labels" -}}
helm.sh/chart: {{ include "stirlingpdf.chart" . }}
{{ include "stirlingpdf.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Nom du chart
*/}}
{{- define "stirlingpdf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels sélecteurs
*/}}
{{- define "stirlingpdf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stirlingpdf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Variables d'environnement
*/}}
{{- define "stirlingpdf.envVars" -}}
{{- range $key, $value := .Values.env }}
- name: {{ $key | upper }}
  value: {{ $value | quote }}
{{- end }}
{{- end }}
