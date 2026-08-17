allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    // gallery_saver_plus hardcodes compileSdk 31, which its dependencies no
    // longer support. Register the override before forcing :app evaluation so
    // it runs after each library script has set its own value.
    project.afterEvaluate {
        if (project.plugins.hasPlugin("com.android.library")) {
            val appSdk = (project(":app").extensions.getByName("android")
                as com.android.build.api.dsl.ApplicationExtension).compileSdk
            (project.extensions.getByName("android")
                as com.android.build.api.dsl.LibraryExtension).compileSdk = appSdk
        }
    }
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
