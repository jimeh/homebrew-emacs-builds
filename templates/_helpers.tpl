{{ define "sources" -}}
{{ $arm64SHA := (.SHA256 "macOS-11" "arm64") -}}
{{ $arm64URL := (.DownloadURL "macOS-11" "arm64") -}}
{{ $x86_64SHA := (.SHA256 "macOS-11" "x86_64") -}}
{{ $x86_64URL := (.DownloadURL "macOS-11" "x86_64") -}}
{{- if ne $arm64URL "" }}
  on_arm do
    sha256 '{{ $arm64SHA }}'
    url '{{ $arm64URL }}'
    depends_on macos: '>= :big_sur'
  end
{{- end }}
{{- if ne $x86_64URL "" }}
  on_intel do
    sha256 '{{ $x86_64SHA }}'
    url '{{ $x86_64URL }}'
    depends_on macos: '>= :big_sur'
  end
{{- end }}
{{- end -}}
