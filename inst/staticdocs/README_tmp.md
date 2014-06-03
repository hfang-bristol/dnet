<a href="index.html"><IMG src="dnet_logo1.png" height="100px" id="logo"></a>

<B><h3>An open-source R package for integrative analysis of high-throughput digitised data (eg expression, mutation and replication timing) in terms of `network`, `ontology` and `evolution`</h3></B>

## Introduction

`dnet` intends to analyse the biological network whose nodes/genes are associated with dynamic information such as cross-sample expression levels (mutation status or replication timing), for identifying gene-active dynamic subnetworks.

`dnet` also supports enrichment analysis using a variety of ontologies (their annotations) and using gene phylostratific age information. 

`dnet` is able to conduct analyses in human but also common model organisms: mouse, rat, chicken, c.elegans, fruitfly, zebrafish and arabidopsis.

`dnet` aims to deliver a tool with rich visuals but less inputs.

## Features

* Identification of gene-active dynamic networks
* Network-based sample classifications and visualisations on 2D sample landscape
* Random walk with restart for network affinity calculation
* Enrichment analysis (Fisher's exact test, Hypergeometric test, Binomial test or KS-like test) that can account for the hierarchy of the ontology
* A wide variety of data supported: ontologies (including `Gene Ontology`, `Disease Ontology`, `Human Phenotype` and `Mammalian Phenotype`), phylostratific age information and gene association networks in many organisms. For details, please refer to [RData](http://dnet.r-forge.r-project.org/rdata.html).
* This package can run on `Windows`, `Mac` and `Linux`

## User I/O

<a href="javascript:newWin('dnet_userIO.png', 'dnet_userIO.png', '800', '800')" title="Click to enlarge"><img style="max-width:95%;border:1px solid #0000FF;box-shadow:5px 5px 2px #C0C0FF;" src='dnet_userIO.png', width="400px" /></a>
