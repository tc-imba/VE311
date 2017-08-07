#/bin/bash

RD=(1K 10K 100K 500K 1MEG)

for ((i=0;i<${#RD[@]};++i)); do
    cat ./p1.cir.head > temp.cir
    echo "RD  4   5   ${RD[$i]}" >> temp.cir
    cat ./p1.cir.tail >> temp.cir
    ngspice -b temp.cir > p1_${i}.result    
done

rm -f ./temp.cir

