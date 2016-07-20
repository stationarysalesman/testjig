#!/bin/bash

echo "Total execution time, Total chunk ticks, Main engine ticks"
for i in `seq 1 10`;
do
	./px_serial sequence_dbs/AAA_19.hmm sequence_dbs/uniprot_sprot
done
