RDAFILE="~/Dropbox/MICROBIOME/imap-data-processing/data/external/external_ps_objects.rda"
OUTDIR="data"

mkdir -p "${OUTDIR}"

cp "${RDAFILE}" "${OUTDIR}"/processed_data.rda

