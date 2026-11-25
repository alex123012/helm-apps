{{- define "apps-httproutes" }}
{{- $ := index . 0 }}
{{- with index . 1 }}
{{- $_ := set . "__GroupVars__" (dict "type" "apps-httproutes" "name" "apps-httproutes") }}
{{- include "apps-utils.renderApps" (list $ .) }}
{{- end }}
{{- end }}

{{- define "apps-httproutes.render" }}
{{- include "apps-components.httpRoute" (list . .CurrentApp) }}
{{- end }}

{{- define "apps-components.httpRoute" }}
{{- $ := index . 0 }}
{{- with index . 1 }}
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
{{- include "apps-helpers.metadataGenerator" (list $ .) }}
spec:
{{- $fields := dict "Lists" (list "parentRefs" "hostnames" "rules") }}
{{- include "apps-utils.generateSpecs" (list $ . $fields) | trim | nindent 2 }}
{{- end }}
{{- end }}
