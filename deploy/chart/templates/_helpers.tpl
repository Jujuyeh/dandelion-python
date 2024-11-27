{{/* Generate a unique name for resources based on the release name */}}
{{- define "dandelion.fullname" -}}
{{- .Release.Name -}}
{{- end }}

{{/* Generate a name prefixed with the release name */}}
{{- define "dandelion.name" -}}
{{- printf "%s-%s" (include "dandelion.fullname" .) .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

