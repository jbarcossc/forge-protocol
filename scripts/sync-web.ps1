$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$www = Join-Path $root 'www'

if (Test-Path $www) {
  Remove-Item $www -Recurse -Force
}

New-Item -ItemType Directory -Path $www | Out-Null
New-Item -ItemType Directory -Path (Join-Path $www 'data') | Out-Null

Copy-Item (Join-Path $root 'index.html') $www
Copy-Item (Join-Path $root 'app.js') $www
Copy-Item (Join-Path $root 'styles.css') $www
Copy-Item (Join-Path $root 'manifest.webmanifest') $www
Copy-Item (Join-Path $root 'data/bodyweight-exercises.js') (Join-Path $www 'data')
if (Test-Path (Join-Path $root 'videos')) {
  Copy-Item (Join-Path $root 'videos') (Join-Path $www 'videos') -Recurse
}