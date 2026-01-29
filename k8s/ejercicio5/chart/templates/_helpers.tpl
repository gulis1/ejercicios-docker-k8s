{{- define "ejercicio5.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "ejercicio5.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}
