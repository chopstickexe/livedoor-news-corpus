# /bin/bash

SOURCE=ldcc-20140209.tar.gz
wget https://www.rondhuit.com/download/${SOURCE}
tar zxvf ${SOURCE}

TMP_DIR=./text
OUT_FILE=livedoor.tsv

echo -en "class\tfilename\turl\ttimestamp\ttitle\tbody" > ${OUT_FILE}
for CLASS in dokujo-tsushin it-life-hack kaden-channel livedoor-homme movie-enter peachy smax sports-watch topic-news; do
    echo ${CLASS}
    for FILENAME in `basename -a ${TMP_DIR}/${CLASS}/${CLASS}-*`; do 
	echo -en "${CLASS}\t${FILENAME}\t"
	echo -n `sed -n 1P ./text/${CLASS}/${FILENAME}`
	echo -en "\t"
	echo -n `sed -n 2P ./text/${CLASS}/${FILENAME}`
	echo -en "\t"
	echo -n `sed -n 3P ./text/${CLASS}/${FILENAME}`
	echo -en "\t"
	echo `sed -e '1,3d' ./text/${CLASS}/${FILENAME}`
    done >> ${OUT_FILE}
done

rm ${SOURCE}
rm -r ${TMP_DIR}

