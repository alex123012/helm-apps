{{- define "apps-endpointslices" }}
  {{- $ := index . 0 }}
  {{- $RelatedScope := index . 1 }}
    {{- if not (kindIs "invalid" $RelatedScope) }}
  {{- $_ := set $RelatedScope "__GroupVars__" (dict "type" "apps-endpointslices" "name" "apps-endpointslices") }}
  {{- include "apps-utils.renderApps" (list $ $RelatedScope) }}
{{- end -}}
{{- end -}}

{{- define "apps-endpointslices.render" }}
{{- $ := . }}
{{- with $.CurrentApp }}
{{- include "apps-components._endpointslice" (list $ .) }}
{{- end }}
{{- end }}
