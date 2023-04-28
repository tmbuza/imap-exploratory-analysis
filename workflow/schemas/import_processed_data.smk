
rule import_processed_data:
    output:
        "data/processed_data.rda"
    conda:
        "../envs/environment.yml"
    shell:
        "bash workflow/scripts/import_processed_data.R"
   
