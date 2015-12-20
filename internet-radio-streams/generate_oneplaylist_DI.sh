#!/usr/bin/env bash

playlists_root_dir="."
pls_dir="${playlists_root_dir}/pls/digitallyimported"
m3u_dir="${playlists_root_dir}/m3u/digitallyimported"

mkdir -p "${pls_dir}"
mkdir -p "${m3u_dir}"

declare -A stations=(
	["00's Club Hits"]="http://pub4.di.fm/di_00sclubhits"
	["Ambient"]="http://pub4.di.fm/di_ambient"
	["Bass n Jack in House"]="http://pub4.di.fm/di_bassnjackinhouse"
	["Bassline"]="http://pub4.di.fm/di_bassline"
	["Big Room House"]="http://pub4.di.fm/di_bigroomhouse"
	["Breaks"]="http://pub4.di.fm/di_breaks"
	["Chill Hop"]="http://pub4.di.fm/di_chillhop"
	["Chill Out"]="http://pub4.di.fm/di_chillout"
	["Chill Out Dreams"]="http://pub4.di.fm/di_chilloutdreams"
	["Chip Tunes"]="http://pub4.di.fm/di_chiptunes"
	["Classic Euro Dance"]="http://pub4.di.fm/di_classiceurodance"
	["Classic Euro Disco"]="http://pub4.di.fm/di_classiceurodisco"
	["Classic Trance"]="http://pub4.di.fm/di_classictrance"
	["Classic Vocal Trance"]="http://pub4.di.fm/di_classicvocaltrance"
	["Club Dub Step"]="http://pub4.di.fm/di_clubdubstep"
	["Club Sounds"]="http://pub4.di.fm/di_clubsounds"
	["Cosmic Down Tempo"]="http://pub4.di.fm/di_cosmicdowntempo"
	["Dark DNB"]="http://pub4.di.fm/di_darkdnb"
	["Deep House"]="http://pub4.di.fm/di_deephouse"
	["Deep Nu Disco"]="http://pub4.di.fm/di_deepnudisco"
	["Deep Tech"]="http://pub4.di.fm/di_deeptech"
	["Discoun House"]="http://pub4.di.fm/di_discohouse"
	["DJ Mixes"]="http://pub4.di.fm/di_djmixes"
	["Down Tempo Lounge"]="http://pub4.di.fm/di_downtempolounge"
	["Drum and Bass"]="http://pub4.di.fm/di_drumandbass"
	["DubStep"]="http://pub4.di.fm/di_dubstep"
	["Electronica"]="http://pub4.di.fm/di_eclectronica"
	["Electro House"]="http://pub4.di.fm/di_electrohouse"
	["Epic Trance"]="http://pub4.di.fm/di_epictrance"
	["Euro Dance"]="http://pub4.di.fm/di_eurodance"
	["Funky House"]="http://pub4.di.fm/di_funkyhouse"
	["Futyre Synth Pop"]="http://pub4.di.fm/di_futuresynthpop"
	["Glitch Hop"]="http://pub4.di.fm/di_glitchhop"   
	["Goapsy"]="http://pub4.di.fm/di_goapsy"
	["Hands Up"]="http://pub4.di.fm/di_handsup"
	["Hard Core"]="http://pub4.di.fm/di_hardcore"
	["Hard Dance"]="http://pub4.di.fm/di_harddance"
	["Hard Style"]="http://pub4.di.fm/di_hardstyle"
	["House"]="http://pub4.di.fm/di_house"
	["Latin House"]="http://pub4.di.fm/di_latinhouse"
	["Liquid DNB"]="http://pub4.di.fm/di_liquiddnb"
	["Liquid Dub Step"]="http://pub4.di.fm/di_liquiddubstep"
	["Lounge"]="http://pub4.di.fm/di_lounge"
	["Main Stage"]="http://pub4.di.fm/di_mainstage"
	["Minimal"]="http://pub4.di.fm/di_minimal"
	["Old School Acid"]="http://pub4.di.fm/di_oldschoolacid"
	["Old School Electronica"]="http://pub4.di.fm/di_oldschoolelectronica"
	["Progressive"]="http://pub4.di.fm/di_progressive"
	["Progressive PSY"]="http://pub4.di.fm/di_progressivepsy"
	["PSY Chill"]="http://pub4.di.fm/di_psychill"
	["Russian Club Hits"]="http://pub4.di.fm/di_russianclubhits"
	["San Keys"]="http://pub4.di.fm/di_sankeys"
	["Soulful House"]="http://pub4.di.fm/di_soulfulhouse"
	["Space Music"]="http://pub4.di.fm/di_spacemusic"
	["Tech House"]="http://pub4.di.fm/di_techhouse"
	["Techno"]="http://pub4.di.fm/di_techno"
	["Trance"]="http://pub4.di.fm/di_trance"
	["Trap"]="http://pub4.di.fm/di_trap"
	["Tribal House"]="http://pub4.di.fm/di_tribalhouse"
	["UK Garage"]="http://pub4.di.fm/di_ukgarage"
	["UMF Radio"]="http://pub4.di.fm/di_umfradio"
	["Vocal ChillOut"]="http://pub4.di.fm/di_vocalchillout"
	["Vocal Trance"]="http://pub4.di.fm/di_vocaltrance"
)

pls_file="${pls_dir}/digitallyimported.pls"
m3u_file="${m3u_dir}/digitallyimported.m3u"

rm ${m3u_file}
rm ${pls_file}

touch ${pls_file}
touch  ${m3u_file}

echo "[playlist]" > "${pls_file}"
echo "NumberOfEntries=100" >> "${pls_file}"


for station in "${!stations[@]}"; do
  echo "Generating $station playlist"
  #pls_url="http://somafm.com/$station.pls"
  #m3u_url="http://somafm.com/m3u/$station.m3u"


  echo "#EXTM3U" >> "${m3u_file}"
  echo "#EXTINF:-1,$station" >> "${m3u_file}"
  echo "${stations["$station"]}" >> "${m3u_file}"

  echo "" >> "${pls_file}"
  echo "File1=${stations["$station"]}" >> "${pls_file}"
  echo "Title1=$station" >> "${pls_file}"
  echo "Length1=-1" >> "${pls_file}"

done
