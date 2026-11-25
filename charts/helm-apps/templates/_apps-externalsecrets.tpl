{{- define "apps-externalsecrets" }}
{{- $ := index . 0 }}
{{- with index . 1 }}
{{- $_ := set . "__GroupVars__" (dict "type" "apps-externalsecrets" "name" "apps-externalsecrets") }}
{{- include "apps-utils.renderApps" (list $ .) }}
{{- end }}
{{- end }}

{{- define "apps-externalsecrets.render" }}
{{- include "apps-components.externalSecret" (list . .CurrentApp) }}
{{- end }}

{{- define "apps-components.externalSecret" }}
{{- $ := index . 0 }}
{{- with index . 1 }}
apiVersion: external-secrets.io/v1
kind: ExternalSecret
{{- include "apps-helpers.metadataGenerator" (list $ .) }}
spec:
{{- $fields := dict "Strings" (list "refreshPolicy" "refreshInterval") "Maps" (list "secretStoreRef" "target") "Lists" (list "data" "dataFrom") }}
{{- include "apps-utils.generateSpecs" (list $ . $fields) | trim | nindent 2 }}
{{- end }}
{{- end }}
