#!/bin/sh
# Get 32-bit libs required for Dwarf Fortress on 64-bit Linux.

if [ ! -d temp ]
then 
  mkdir temp
fi

# Save the file from $1 as $2 using wget.
fetchextract() {
url="$1"
file="$2"
wget -O "temp/$file" "$url"/"$file" || die
dpkg -x "temp/$file" temp
}

# Get the required libs:
fetchextract "http://ftp.us.debian.org/debian/pool/main/s/sdl-image1.2" "libsdl-image1.2_1.2.10-2+b2_i386.deb"
fetchextract "http://ftp.us.debian.org/debian/pool/main/s/sdl-ttf2.0" "libsdl-ttf2.0-0_2.0.9-1_i386.deb"
fetchextract "http://ftp.us.debian.org/debian/pool/main/o/openal-soft" "libopenal1_1.12.854-2_i386.deb"

# Put them to df's libs directory:
cp temp/usr/lib/libopenal.so.1 libs/libopenal.so
cp temp/usr/lib/libSDL_image-1.2.so.0 libs/.
cp temp/usr/lib/libSDL_ttf-2.0.so.0 libs/.

# Clean up
rm -rf temp

