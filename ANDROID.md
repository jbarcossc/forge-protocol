# Forge Protocol en Android

La app web se puede empaquetar como una aplicación Android local usando Capacitor. No requiere servidor, cuenta ni backend: el progreso sigue guardándose en el dispositivo.

## Requisitos

1. Instalar Android Studio.
2. Instalar Android SDK Platform 35 y Android SDK Build-Tools desde el SDK Manager.
3. Instalar un JDK 21 y configurar `JAVA_HOME`.
4. Tener Node.js instalado.

## Crear el proyecto Android

Desde la carpeta del proyecto:

```powershell
npm install
npm run android:add
```

El primer comando crea la carpeta `android/` y agrega la plataforma Android. Para abrirla en Android Studio:

```powershell
npm run android:open
```

## Generar APK debug

```powershell
npm run android:build
```

El script busca automáticamente el JDK 21 en las rutas habituales, por lo que también funciona desde una terminal de Android Studio que no haya heredado `JAVA_HOME`.

El APK queda en:

`android/app/build/outputs/apk/debug/app-debug.apk`

Podés copiar ese archivo al teléfono e instalarlo habilitando instalaciones desde esta fuente, o conectar el teléfono por USB con depuración USB activa y ejecutar:

```powershell
cd android
adb install -r app/build/outputs/apk/debug/app-debug.apk
```

Cada vez que cambies la app web, ejecutá:

```powershell
npm run android:sync
```

Esto vuelve a copiar `index.html`, `app.js`, `styles.css`, el manifest y el catálogo de ejercicios a la app Android.