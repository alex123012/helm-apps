{{- define "apps-endpoints" }}
  {{- $ := index . 0 }}
  {{- $RelatedScope := index . 1 }}
    {{- if not (kindIs "invalid" $RelatedScope) }}
  {{- $_ := set $RelatedScope "__GroupVars__" (dict "type" "apps-endpoints" "name" "apps-endpoints") }}
  {{- include "apps-utils.renderApps" (list $ $RelatedScope) }}
{{- end -}}
{{- end -}}

{{- define "apps-endpoints.render" }}
{{- $ := . }}
{{- with $.CurrentApp }}
{{- include "apps-components._endpoint" (list $ .) }}
{{- end }}
{{- end }}
