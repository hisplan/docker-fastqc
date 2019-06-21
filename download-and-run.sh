#!/bin/bash

usage()
{
cat << EOF
USAGE: `basename $0` [options]

    -p	relative path to download FASTQ and store QC report
    -i  Illumina BaseSpace Project ID

EOF
}

while getopts "p:i:h" OPTION
do
    case $OPTION in
        p) path_work=$OPTARG ;;
        i) run_id=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$path_work" ]
then
    usage
    exit 1
fi

mkdir -p ${path_work}

if [ ! -z "$run_id" ]
then
    bs download project -i ${run_id} -o ${path_work} --extension=fastq.gz
fi

files=`find ${path_work} -name "*.fastq.gz"`

for file in $files
do
    echo $file

    docker run -it --rm \
        -v "$(pwd)/${path_work}":/${path_work} \
        fastqc /${file}

done
