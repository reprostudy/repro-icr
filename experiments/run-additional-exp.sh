#!/bin/bash

OUTPUT_DIR="./output" # Change this to 'experiments' to track results in git

for path in 5var-nl
do
    if [ ! -d "$OUTPUT_DIR/$path" ]; then
        mkdir -p $OUTPUT_DIR/$path
    fi
done

echo "
python scripts/run_experiments.py 5var-nonlinear 4000 200 0.9 300 $OUTPUT_DIR/5var-nl/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf;
python scripts/run_experiments.py 5var-nonlinear 4000 200 0.75 300 $OUTPUT_DIR/5var-nl/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf;
python scripts/run_experiments.py 5var-nonlinear 4000 200 0.85 300 $OUTPUT_DIR/5var-nl/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf;
python scripts/run_experiments.py 5var-nonlinear 4000 200 0.95 300 $OUTPUT_DIR/5var-nl/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf;
" | parallel -j 20
