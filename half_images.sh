for i in $( ls *.JPG)
do 
  convert -resize 50% $i re_$i
done
