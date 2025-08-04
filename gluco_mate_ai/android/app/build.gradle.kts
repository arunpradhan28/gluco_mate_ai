plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") version "4.4.3" apply false
}

android {
    namespace = "com.example.gluco_mate_ai"
    compileSdk = 34
    ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.gluco_mate_ai"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

  buildTypes {
    release {
        isMinifyEnabled = true       // ✅ enables R8/Proguard
        isShrinkResources = true     // ✅ Kotlin DSL syntax (not shrinkResources)

        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
}



    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Firebase BoM (manages all Firebase versions automatically)
    implementation(platform("com.google.firebase:firebase-bom:34.0.0"))

    // Firebase Products
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-firestore")
    // Add more Firebase products if needed
}

// ✅ APPLY THE PLUGIN - REQUIRED FOR `google-services.json` to work
apply(plugin = "com.google.gms.google-services")
