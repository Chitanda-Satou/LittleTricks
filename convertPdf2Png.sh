#!/usr/bin/env bash
set -x
############################################################################
# 1 依赖imagemagick
# sudo apt install -y imagemagick

# 2 imagemagick的使用方法
# convert foo.pdf foo.png
############################################################################
export job_num=8

if [ ! -d "PNGs" ];then
    mkdir PNGs
fi

pdf2Png () {
    input=$1
    convert -resize 100% -density 300 $input ${input/.pdf/.png}
}

export -f pdf2Png
# find `pwd` -name "*.pdf" -exec ln -s {} `pwd` \;
ls *.pdf | parallel -j $job_num pdf2Png
ls *.png | parallel -j $job_num mv {} ./PNGs/
# rm *.pdf
