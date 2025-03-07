#!/usr/bin/env bash

SH_DIR=$(dirname $(realpath "$0"))

wget https://castillo.dicom.unican.es/zaguan/Copla/Copla_databases_latest.tar
tar -xf Copla_databases_latest.tar

COPLA_DB_DIR=`grep '^COPLA_DB_DIR' ${SH_DIR%/*}/copla.ini | cut -f2`

find ${COPLA_DB_DIR} -type f -name "*.fna.gz" -print0 | xargs -0 gunzip

awk -v path=${COPLA_DB_DIR} '{ print path "/" $1 ".fna" }' ${COPLA_DB_DIR}/CoplaDB.lst > ${COPLA_DB_DIR}/CoplaDB.fofn
