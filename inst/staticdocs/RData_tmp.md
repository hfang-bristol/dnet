## Introduction
As part of the package, the built-in RData (with `.RData` extension; available at [http://dnet.r-forge.r-project.org/data](http://dnet.r-forge.r-project.org/data)) contain curated/compiled data, which can be broadly grouped into the following categories:

* `Ontologies`

Locate in the subdirectory [Obo](http://dnet.r-forge.r-project.org/data/Obo), containing information on ontology terms and their relationships. Ontologies include Gene Ontology (GO) and its three subontologies (BP: Biological Process; MF: Molecular Function; CC: Cellular Component), Human Phenotype (HP) and its three subontologies (PA: Phenotypic Abnormality; ON: ONset and clinical course; MI: Mode of Inheritance), Disease Ontology (DO), and Mammalian Phenotype (MP). Terms in an ontology are organised as a direct acyclic graph (DAG), which is further stored as an object of the class [igraph](http://igraph.sourceforge.net/doc/R/aaa-igraph-package.html).

* `Organism-specific databases`

Organisms supported are: [human](http://dnet.r-forge.r-project.org/data/Hs) (`Hs`; tax_id=10090), [mouse](http://dnet.r-forge.r-project.org/data/Mm) (`Mm`; tax_id=10090), [arabidopsis](http://dnet.r-forge.r-project.org/data/At) (`At`; tax_id=3702), [c.elegans](http://dnet.r-forge.r-project.org/data/Ce) (`Ce`; tax_id=6239), [fruitfly](http://dnet.r-forge.r-project.org/data/Dm) (`Dm`; tax_id=7227), [zebrafish](http://dnet.r-forge.r-project.org/data/Da) (`Da`; tax_id=7955), [rat](http://dnet.r-forge.r-project.org/data/Rn) (`Rn`; tax_id=10116) and [chicken](http://dnet.r-forge.r-project.org/data/Gg) (`Gg`; tax_id=9031). For example, human-specific databases contain information on Entrez Genes, their annotations by a variety of ontologies, their evolutionary age (or called 'phylostratific age', PS), their assigned domain superfamilies (SF), and their interacting network derived from STRING.

* `Genesets in human`

Locate in the subdirectory [Msigdb](http://dnet.r-forge.r-project.org/data/Msigdb). These genesets are derived from the molecular signatures database.

* `Datasets as demos`

Locate in the subdirectory [Datasets](http://dnet.r-forge.r-project.org/data/Datasets). They are used in [Demos](http://dnet.r-forge.r-project.org/demos.html)

## Documentations and Download

For details, please refer to [Documentations](http://dnet.r-forge.r-project.org/docs.html).

In addition to download (as shown above), the `Linux/Mac` user can use shell commands in Terminal for download in one go:
    
    # recursively download all RData files (preserving the whole directory structure)
    wget -r -l2 -A "*.RData" -np -nH --cut-dirs=0 "http://dnet.r-forge.r-project.org/data" 
    # view the download
    ls -lh -R data
