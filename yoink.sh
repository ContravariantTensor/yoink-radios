#!/bin/bash
#
# small script that yoinks youtube radios (or any playlistable link) and iterates over them, by S
# in --cookies-from-browser option, replace with path to folder with cookies.sqlite or whtvr ur browser uses. for librewolf/anything firefox based, just use firefox and give it the path. shud work.
# this will say it has several thousand videos to download, cos radio will extend out a bit, but it will only download however many u set, 25 is default radio length
# for more precise indexing, just edit --playlist-items yourself
# also ts will sometimes say "page __: Downloading API JSON", just let it do that unless __ goes like rllly big

read -p "Enter the radio link: " radio_url
read -p "Enter the size of the radio (number of tracks): " number_of_tracks

yt-dlp \
  --cookies-from-browser "<PUT_YOUR_BROWSER_HERE>" \
  --playlist-items 1-$number_of_tracks \
  --ignore-errors \
  --continue \
  --no-overwrites \
  --download-archive downloaded.txt \
  -x \
  --audio-format m4a \
  --audio-quality 0 \
  --embed-metadata \
  --embed-thumbnail \
  "${radio_url}"
