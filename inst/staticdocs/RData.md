## Introduction
As part of the package, the built-in RData (with `.RData` extension; available at [http://supfam.org/dnet/data.tar](http://supfam.org/dnet/data.tar) or [http://dnet.r-forge.r-project.org/data](http://dnet.r-forge.r-project.org/data)) contain curated/compiled data, which can be broadly grouped into the following categories:

* `Ontologies`

Ontologies include Gene Ontology (GO) and its three subontologies (BP: Biological Process; MF: Molecular Function; CC: Cellular Component), Human Phenotype (HP) and its three subontologies (PA: Phenotypic Abnormality; ON: ONset and clinical course; MI: Mode of Inheritance), Disease Ontology (DO), and Mammalian Phenotype (MP). Terms in an ontology are organised as a direct acyclic graph (DAG), which is further stored as an object of the class [igraph](http://igraph.org/r/doc/aaa-igraph-package.html).

* `Organism-specific databases`

Organisms supported are: human (`Hs`; tax_id=10090), mouse (`Mm`; tax_id=10090), arabidopsis (`At`; tax_id=3702), c.elegans (`Ce`; tax_id=6239), fruitfly (`Dm`; tax_id=7227), zebrafish (`Da`; tax_id=7955), rat (`Rn`; tax_id=10116) and chicken (`Gg`; tax_id=9031). For example, human-specific databases contain information on Entrez Genes, their annotations by a variety of ontologies, their evolutionary age (or called 'phylostratific age', PS), their assigned domain superfamilies (SF), and their interacting network derived from STRING.

* `Genesets in human`

These genesets are derived from the molecular signatures database.

* `Datasets as demos`

They are used in <a href="demos.html" target="slides" style="font-size: 12px; color: #0000FF; text-decoration: overline; border-bottom: 1px solid #0000FF">Demos</a>.

## Documentations

For details, please refer to <a href="docs.html" target="slides" style="font-size: 12px; color: #0000FF; text-decoration: overline; border-bottom: 1px solid #0000FF">Documentations</a>.

