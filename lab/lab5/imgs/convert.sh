for f in *.pdf;
do 
    convert -verbose -colorspace RGB -interlace none -density 300 -quality 100 $f ${f%.*}.jpg
    convert ${f%.*}.jpg ${f%.*}.png
    rm ${f%.*}.jpg
done
