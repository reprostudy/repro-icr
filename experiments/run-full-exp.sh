#!/bin/bash

OUTPUT_DIR="./output" # Change this to 'experiments' to track results in git

for path in 3var-nc 3var-c 5var-skill 7var-covid
do
    if [ ! -d "$OUTPUT_DIR/$path" ]; then
        mkdir -p $OUTPUT_DIR/$path
    fi
done

echo "
python scripts/run_experiments.py 3var-noncausal 4000 200 0.9 300 $OUTPUT_DIR/3var-nc/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-nc/output_0.9.log;
python scripts/run_experiments.py 3var-noncausal 4000 200 0.75 300 $OUTPUT_DIR/3var-nc/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-nc/output_0.75.log;
python scripts/run_experiments.py 3var-noncausal 4000 200 0.85 300 $OUTPUT_DIR/3var-nc/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-nc/output_0.85.log;
python scripts/run_experiments.py 3var-noncausal 4000 200 0.95 300 $OUTPUT_DIR/3var-nc/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-nc/output_0.95.log;

python scripts/run_experiments.py 3var-causal 4000 200 0.9 300 $OUTPUT_DIR/3var-c/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-c/output_0.9.log;
python scripts/run_experiments.py 3var-causal 4000 200 0.75 300 $OUTPUT_DIR/3var-c/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-c/output_0.75.log;
python scripts/run_experiments.py 3var-causal 4000 200 0.85 300 $OUTPUT_DIR/3var-c/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-c/output_0.85.log;
python scripts/run_experiments.py 3var-causal 4000 200 0.95 300 $OUTPUT_DIR/3var-c/ 10 --NGEN 600 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True &> $OUTPUT_DIR/3var-c/output_0.95.log;

python scripts/run_experiments.py 5var-skill 4000 200 0.9 300 $OUTPUT_DIR/5var-skill/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/5var-skill/output_0.9.log;
python scripts/run_experiments.py 5var-skill 4000 200 0.75 300 $OUTPUT_DIR/5var-skill/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/5var-skill/output_0.75.log;
python scripts/run_experiments.py 5var-skill 4000 200 0.85 300 $OUTPUT_DIR/5var-skill/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/5var-skill/output_0.85.log;
python scripts/run_experiments.py 5var-skill 4000 200 0.95 300 $OUTPUT_DIR/5var-skill/ 10 --NGEN 1000 --POP_SIZE 500 --n_digits 0 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/5var-skill/output_0.95.log;

python scripts/run_experiments.py 7var-covid 20000 200 0.9 2999 $OUTPUT_DIR/7var-covid/ 10 --NGEN 700 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/7var-covid/output_0.9.log;
python scripts/run_experiments.py 7var-covid 20000 200 0.75 2999 $OUTPUT_DIR/7var-covid/ 10 --NGEN 700 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/7var-covid/output_0.75.log;
python scripts/run_experiments.py 7var-covid 20000 200 0.85 2999 $OUTPUT_DIR/7var-covid/ 10 --NGEN 700 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/7var-covid/output_0.85.log;
python scripts/run_experiments.py 7var-covid 20000 200 0.95 2999 $OUTPUT_DIR/7var-covid/ 10 --NGEN 700 --POP_SIZE 300 --n_digits 1 --nr_refits 5 --predict_individualized True --model_type rf &> $OUTPUT_DIR/7var-covid/output_0.95.log
" | parallel -j 20
