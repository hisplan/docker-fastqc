#!/bin/bash

usage()
{
cat << EOF
USAGE: `basename $0` [options]

    -i  absolute path to FASTQ
    -o  relative path to store FASTQC reports

EXAMPLE:

    ./run.sh -i /Users/chunj/projects/docker-bcl2fastq/outputs/run-186690504 -o $(pwd)/outputs/tammela3

EOF
}

while getopts "i:o:h" OPTION
do
    case $OPTION in
        i) path_abs_src=$OPTARG ;;
        o) path_out=$OPTARG ;;
        h) usage; exit 1 ;;
        *) usage; exit 1 ;;
    esac
done

if [ -z "$path_abs_src" ] | [ -z "$path_out" ]
then
    usage
    exit 1
fi

mkdir -p ${path_out}

files=`find ${path_abs_src} -name "*.fastq.gz"`

for file in $files
do
    echo $file

    docker run -it --rm \
        -v "${file}":${file} \
        -v "${path_out}":/data \
        fastqc -o /data ${file}

done
