rm -rf Rundbriefe-master && rm master.zip
rm -rf data/editions &&rm -rf data/indices
wget https://github.com/ArchiveTFMVienna/Rundbriefe/archive/refs/heads/master.zip
unzip master
mv Rundbriefe-master/data/editions ./data/editions
mv Rundbriefe-master/data/indices ./data/indices
./dl_imprint.sh
rm -rf Rundbriefe-master && rm master.zip


echo "add ids"
add-attributes -g "./data/editions/*.xml" -b "https://id.acdh.oeaw.ac.at/rundbriefe"
add-attributes -g "./data/indices/*.xml" -b "https://id.acdh.oeaw.ac.at/rundbriefe"
add-attributes -g "./data/meta/*.xml" -b "https://id.acdh.oeaw.ac.at/rundbriefe"


# echo "create calendar data"
# python make_calendar_data.py

denormalize-indices -x './/tei:title[@type="sub"]/text()' -i './data/indices/list*.xml' -f './data/editions/*.xml'