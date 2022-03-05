#!/bin/bash
filename_stems=("pendigits", "letter", "yeast", "splice-1", "mushroom", "zoo-1", "diabetes", "segment", "vote", "kr-vs-kp", "lymph", "ionosphere", "soybean", "hypothyroid", "vehicle", "primary-tumor", "australian-credit", "anneal", "hepatitis", "audiology", "heart-cleveland", "tic-tac-toe", "breast-wisconsin", "german-credit")
stems=("pendigits" "letter" "yeast" "splice-1" "mushroom" "zoo-1" "diabetes" "segment" "vote" "kr-vs-kp" "lymph" "ionosphere" "soybean" "hypothyroid" "vehicle" "primary-tumor" "australian-credit" "anneal" "hepatitis" "audiology" "heart-cleveland" "tic-tac-toe" "breast-wisconsin" "german-credit")

for filename in ${stems[@]}
do
	for k in {1..20}
	do
		echo $filename $k
		python run_gosdt_single.py -n $filename -b $k
	done
done

