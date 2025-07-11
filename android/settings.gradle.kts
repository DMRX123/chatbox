import java.util.Properties

pluginManagement {
    val flutterSdkPath = run {
        val properties = Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdk = properties.getProperty("flutter.sdk")
        requireNotNull(flutterSdk) { "flutter.sdk not set in local.properties" }
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    plugins {
        id("com.android.application") version "8.3.1" apply false
        id("org.jetbrains.kotlin.android") version "1.9.22" apply false
        id("com.google.gms.google-services") version "4.4.0" apply false
        id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

include(":app")