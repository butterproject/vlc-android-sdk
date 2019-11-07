vlc-android-sdk
===============

This repository is a fork of the original [work done](https://github.com/mrmaffen/vlc-android-sdk) by Enno Gottschalk [https://github.com/mrmaffen](mrmaffen) (Thanks dude!)

This project is being used on [tomahawk-android](https://github.com/tomahawk-player/tomahawk-android) and now is also on [butter-android](https://github.com/butterproject/butter-android).

Get it via JCenter
------------------

Just add this dependency to your project and you're good to go:

```
buildscript {
  repositories {
    jcenter()
  }
}

dependencies {
  compile "com.butterproject:vlc-android-sdk:3.0.3"
}
```

Versions correspond with libVLC versions. Optional forth digit is for internal releases for same libVLC version.

Building LibVLC Android SDK yourself
------------------------------------

*Note: Keep in mind that building VLC source code can be a daunting task if is your first time doing it.*

To build a fresh version of the *libVLC* Android SDK, please make sure that you have setup your machine correctly following the official 
Wiki (You can ignore the steps after and including 'Building'): https://wiki.videolan.org/AndroidCompile

Firs you need to compile libVLC for android. So you need to clone repo into `vlc-android` directory. You can easily do
that by calling `config/circleci/clone-repos.sh` bash script. Note that script will also modify `compile-libvlc.sh` file
in cloned repo. This is so we can run code on CircleCI with limited resources available.

Then you can compile libVLC by executing `config/circleci/compile-vlc.sh` bash script. This will compile libVLC and copy all
necessary file into root project.

Afterwards, simply run this Gradle command:

```./gradlew assembleRelease```

Project will be compiled for *armeabi-v7a*, *armeabi*, *x86* and *x86_64* architecture.

Building a specific version of the LibVLC Android SDK
-----------------------------------------------------

If you want to build a specific version (maybe you want a major stable release) you have to checkout the *vlc-android* git repository at 
the corresponding commit:

```
cd vlc-android          // if this folder doesn't exist yet, simply run ./gradlew vlcCloneAndroid
git tag                 // to list all release versions
git checkout {tag-name} // to checkout the git repo at the given tag
cd ..
./gradlew vlcBuild{architecture} // build it, where architecture can be arm, arm64, x86, X86_64
```

By default, when you clone using the `clone-repos.sh` bash script it will checkout automatically to the latest stable version.

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
