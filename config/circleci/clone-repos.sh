#!/bin/bash

echo "Clone vlc android source"
git clone https://code.videolan.org/videolan/vlc-android.git vlc-android
cd vlc-android

echo "Checkout tag"
git checkout 3.0.13
cd ..

echo "Patch compile options"
patch -p1 vlc-android/compile-libvlc.sh < compile-libvlc.patch
