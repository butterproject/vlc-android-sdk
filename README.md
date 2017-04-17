vlc-android-sdk
===============

This repository is a fork of the original [work done](https://github.com/mrmaffen/vlc-android-sdk) by Enno Gottschalk [https://github.com/mrmaffen](mrmaffen) (Thanks dude!)

This project is being used on [tomahawk-android](https://github.com/tomahawk-player/tomahawk-android) and now is also on [butter-android](https://github.com/butterproject/butter-android).

Get it via JCenter
------------------

Just add this dependency to your project and you're good to go:

<pre>
buildscript {
  repositories {
    jcenter()
  }
}

dependencies {
  compile "com.butterproject:vlc-android-sdk:2.0.6"
}
</pre>

Current stable version is **2.0.6**. Although, there are newer versions of the **libVLC** library none of them has been officially pushed to the 
main VLC Android application. So until this happens, it doesn't make sense to update this project.

Building LibVLC Android SDK yourself
------------------------------------

*Note: Keep in mind that building VLC source code can be a daunting task if is your first time doing it.*

To build a fresh version of the *libVLC* Android SDK, please make sure that you have setup your machine correctly following the official 
Wiki (You can ignore the steps after and including 'Building'): https://wiki.videolan.org/AndroidCompile

Afterwards, simply run this Gradle command:

```./gradlew vlcBuild```

The steps that this task will do are the following:

1. The *VLC-Android* and the *VLC* repo will now get pulled if they haven't been previously.
2. After that's done, the compilation process for the ABIs *armeabi-v7a*, *armeabi*, *x86* and *mips* gets started.
3. The resulting .so files will be copied into src/main/jniLibs.
4. Finally, the resulting .java files will be copied over into the src/main/java folder of this project.

You can see all related task to *VLC* just typing in your terminal and search for the group *VLC*:

```./gradlew -q :tasks```

Building a specific version of the LibVLC Android SDK       
-----------------------------------------------------

If you want to build a specific version (maybe you want a major stable release) you have to checkout the *vlc-android* git repository at 
the corresponding commit:

```
cd vlc-android          // if this folder doesn't exist yet, simply run ./gradlew vlcCloneAndroid
git tag                 // to list all release versions
git checkout {tag-name} // to checkout the git repo at the given tag
cd ..
./gradlew vlcBuild{architecture} // build it, where architecture can be arm, arm64, mips, mips64, x86, X86_64     
```

By default, when you clone using the command `./gradlew vlcCloneAndroid` it will checkout automatically to the most stable version possible.

Reporting issues
-----------------

Please contact the [VLC team](https://trac.videolan.org/vlc) directly if you have specific issues with VLC source code. This is only a 
convenience library for Android published to JCenter so, as long as the issue does not affect directly these gradle files, there's no 
much help we can provide with.

Contribute
----------

If you detect a bug or you want to improve the project, feel free to open a pull request.

License
-------

    vlc-android-sdk Copyright (C) 2017  VLC authors, Enno Gottschalk, Aldo Borrero

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.