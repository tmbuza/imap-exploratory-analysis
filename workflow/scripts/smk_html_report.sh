#!/bin/bash

mkdir -p images

# Generate interactive html report
snakemake --report report.html

hti -H report.html -o images/smkreport

