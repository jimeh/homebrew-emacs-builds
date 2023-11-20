{{ define "sources" -}}
{{ $arm64SHA := (.SHA256 "macOS-13" "arm64") -}}
{{ $arm64URL := (.DownloadURL "macOS-13" "arm64") -}}
{{ $x86_64SHA := (.SHA256 "macOS-11" "x86_64") -}}
{{ $x86_64URL := (.DownloadURL "macOS-11" "x86_64") -}}
{{ if (and (ne $arm64URL "") (ne $x86_64URL "")) }}
  on_arm do
    sha256 '{{ $arm64SHA }}'
    url '{{ $arm64URL }}'
    depends_on macos: '>= :ventura'
  end

  on_intel do
    sha256 '{{ $x86_64SHA }}'
    url '{{ $x86_64URL }}'
    depends_on macos: '>= :big_sur' # macOS 11
  end
{{- else if ne $arm64URL "" }}
  sha256 '{{ $arm64SHA }}'
  url '{{ $arm64URL }}'
  depends_on macos: '>= :ventura', arch: :arm64
{{- else }}
  sha256 '{{ $x86_64SHA }}'
  url '{{ $x86_64URL }}'
  depends_on macos: '>= :monterey'
{{- end }}
{{- end }}
