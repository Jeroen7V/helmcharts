{{/*
Create a Database connection url.
*/}}
{{- define "postgresql.url" -}}
  {{- $postgresqlhost := .Values.postgresql.host -}}
  {{- if .Values.postgresql.enabled -}}
    {{- $postgresqlhost = (include "postgresql.primary.fullname" .Subcharts.postgresql) -}}
  {{- end -}}
  {{- printf "postgresql://%s:%s@%s:%.0f/%s" .Values.global.postgresql.auth.username .Values.global.postgresql.auth.password $postgresqlhost .Values.global.postgresql.service.ports.postgresql .Values.global.postgresql.auth.database   -}}
{{- end -}}