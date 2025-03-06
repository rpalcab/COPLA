#!/usr/bin/env bash

SH_DIR=$(dirname "$0")

EXE_CONDA_PATH=`which conda`
source "$(dirname $(realpath "${EXE_CONDA_PATH%/*}"))"/etc/profile.d/conda.sh
conda activate copla

# NZ_CP028167.1
${SH_DIR%/*}/bin/copla.py ${SH_DIR%/*}/test/NZ_CP028167.1.fna \
        ${SH_DIR%/*}/databases/Copla_RS84/RS84f_sHSBM.pickle \
        ${SH_DIR%/*}/databases/Copla_RS84/CoplaDB.fofn \
        ${SH_DIR%/*}/test/NZ_CP028167.1.fna_output \
        -a test/NZ_CP028167.1.faa \
        -t circular \
        -k Bacteria \
        -p Proteobacteria \
        -c Gammaproteobacteria \
        -o Enterobacterales \
        -f Enterobacteriaceae \
        -g Escherichia \
        -s 'Escherichia coli' | \
    tee ${SH_DIR%/*}/test/NZ_CP028167.1.fna_stdout

tar -zcf ${SH_DIR%/*}/test/NZ_CP028167.1.new.tgz -C ${SH_DIR%/*}/test NZ_CP028167.1.fna_output/

# NZ_CP028329.1
bin/copla.py ${SH_DIR%/*}/test/NZ_CP028329.1.fna \
        ${SH_DIR%/*}/databases/Copla_RS84/RS84f_sHSBM.pickle \
        ${SH_DIR%/*}/databases/Copla_RS84/CoplaDB.fofn \
        ${SH_DIR%/*}/test/NZ_CP028329.1.fna_output \
        -a ${SH_DIR%/*}/test/NZ_CP028329.1.faa \
        -t circular \
        -k Bacteria \
        -p Firmicutes \
        -c Bacilli \
        -o Lactobacillales \
        -f Lactobacillaceae \
        -g Lactobacillus \
        -s 'Lactobacillus sp. D1501' | \
    tee ${SH_DIR%/*}/test/NZ_CP028329.1.fna_stdout

tar -zcf ${SH_DIR%/*}/test/NZ_CP028329.1.new.tgz -C ${SH_DIR%/*}/test NZ_CP028329.1.fna_output/
