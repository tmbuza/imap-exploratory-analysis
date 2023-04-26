
rule import_data_objects:
    output:
        "data/processed_data.rda"
    conda:
        "../envs/environment.yml"
    shell:
        "bash workflow/scripts/import_processed_data.sh"
   
