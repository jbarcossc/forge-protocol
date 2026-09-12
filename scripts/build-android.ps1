$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$candidates = @(
  $env:JAVA_HOME,
  'C:\Program Files\Java\jdk-21.0.12',
  'C:\Program Files\Java\jdk-21',
  'C:\Program Files\Android\Android Studio\jbr'
) | Where-Object { $_ -and (Test-Path (Join-Path $_ 'bin\java.exe')) }

if (-not $candidates) {
  throw 'No se encontró un JDK. Instalá JDK 21 y configurá JAVA_HOME.'
}

$env:JAVA_HOME = $candidates[0]
$env:Path = "$(Join-Path $env:JAVA_HOME 'bin');$env:Path"

Push-Location $root
try {
  npm run android:sync
  Push-Location (Join-Path $root 'android')
  try {
    .\gradlew.bat assembleDebug
  } finally {
    Pop-Location
  }
} finally {
  Pop-Location
}