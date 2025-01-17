# Datasets
Toy and benchmark datasets

## Purpose

### Benchmark datasets
We wish to put together a set of data that, after assembly,
the results can be compared back.
These results can include actual assemblies or profiling such as MLST.
There are several advantages including

* Workshops and trainings
* Proficiency testing
* Certifications
* Bioinformatics workflow development
* Baseline comparison between bioinformatics pipelines

### Toy datasets
We wish to put together a set of data that is fast to assemble.
There are several advantages including

* Fast to test new bioinformatics workflows
* Fast to teach new people ONT assembly
* Fast to teach people bioinformatics workflows in a workshop setting

## Summary Tables

### EDLB

This first table lists datasets curated from the Enteric Diseases Laboratory Branch at CDC

| Dataset  | Name | Description | Intended Use |tsv name | Reference |
| ------------- | ------------- | ------------- | ------------- | ------------- | ----------| 
| 1 | Staphylococcus aureus | hybrid Nanopore R9.4.1 and Illumina near-reference quality assembled Staphylococcus aureus whole genomes isolated from sinus swabs from Chronic Rhinosinusitis Patients, along with their plasmids. | Fast assembly of bacterial genomes with AMR | [toy-bacteria-saureus.tsv](/datasets/toy-bacteria-saureus.tsv) | [PRJNA914892](https://ncbi.nlm.nih.gov/bioproject/PRJNA914892) |
| 2 | Salmonella AMR | A set of _Salmonella enterica_ genomes sequenced by ONT from three different publications. | Assembly and then confirmation of AMR results | [Salmonella-AMR.tsv](/datasets/Salmonella-AMR.tsv) | [PMID36036604](https://pubmed.ncbi.nlm.nih.gov/36036604), [PMID35727013](https://pubmed.ncbi.nlm.nih.gov/35727013), [PMID35416692](https://pubmed.ncbi.nlm.nih.gov/35416692) |
| 3 | Campylobacter - PulseNet | A set of Campylobacter outbreaks with allele calls from BioNumerics | Test whole genome MLST caller; outbreak clustering | [campylobacter-pulsenet.tsv](/datasets/campylobacter-pulsenet.tsv) | [PMID37133905](https://pubmed.ncbi.nlm.nih.gov/37133905) |
| 4 | Metagenomics - two outbreaks | A set of metagenomic reads belonging to either an Alabama outbreak or a Colorado outbreak in the US.| Test pipeline on metagenomics outbreak datasets for clustering or pathogen detection | [coal-metagenomics.tsv](/datasets/coal-metagenomics.tsv) | [PMID27881416](https://pubmed.ncbi.nlm.nih.gov/27881416) |
| 5 | Salmonella - PulseNet | A set of Salmonella outbreaks with allele calls from BioNumerics | Test whole genome MLST caller; outbreak clustering | [salm-cgMLST.tsv](/datasets/salm-cgMLST.tsv) | [PMID37808298](https://pubmed.ncbi.nlm.nih.gov/37808298) |
| 6 | Escherichia - PulseNet | A set of Escherichia and Shigella outbreaks with allele calls from BioNumerics | Test whole genome MLST caller; outbreak clustering | [stec-outbreak.tsv](/datasets/stec-outbreak.tsv) |  |
| 7 | Listeria - PulseNet | A set of Listeria outbreaks with allele calls from BioNumerics | Test whole genome MLST caller; outbreak clustering | [listeria-outbreak.tsv](/datasets/listeria-outbreak.tsv) |  |

### Gen-FS

Collaboration on the [Genomics for Food and Feed Safety (Gen-FS)](https://www.sciencedirect.com/science/article/pii/S0362028X22067680)

If using these datasets, please cite [Timme et al 2017](https://peerj.com/articles/3893/).

| Dataset  | Name | Description | Intended Use |tsv name | Reference |
| ------------- | ------------- | ------------- | ------------- | ------------- | ----------| 
| 1        | Stone Fruit Food recall | An outbreak of L. monocytogenes| Outbreak analysis | [Listeria_monocytogenes_1408MLGX6-3WGS.tsv](/datasets/Listeria_monocytogenes_1408MLGX6-3WGS.tsv) | [PMID27694232](https://pubmed.ncbi.nlm.nih.gov/27694232) |
| 2        | Spicy Tuna outbreak | An outbreak of S. enterica | Outbreak analysis | [Salmonella_enterica_1203NYJAP-1.tsv](/datasets/Salmonella_enterica_1203NYJAP-1.tsv) | [PMID25995194](https://pubmed.ncbi.nlm.nih.gov/25995194) |
| 3        | Simulated outbreak | A simulated outbreak of S. enterica | Outbreak analysis | [Salmonella_enterica_1203NYJAP-1.simulated.tsv](/datasets/Salmonella_enterica_1203NYJAP-1.simulated.tsv) | [Timme et al 2017](https://peerj.com/articles/3893/) |
| 4        | Raw Milk outbreak | C. jejuni outbreak | Outbreak analysis | [Campylobacter_jejuni_0810PADBR-1.tsv](/datasets/Campylobacter_jejuni_0810PADBR-1.tsv) | <http://www.outbreakdatabase.com/details/hendricks-farm-and-dairy-raw-milk-2008> |
| 5        | Sprouts Outbreak | E. coli outbreak | Outbreak analysis | [Escherichia_coli_1405WAEXK-1.tsv](/datasets/Escherichia_coli_1405WAEXK-1.tsv) | <http://www.cdc.gov/ecoli/2014/o121-05-14/index.html> |

### SARS-CoV-2 datasets

From <https://github.com/CDCgov/datasets-sars-cov-2/>

If you use these datasets, please cite [Xiaoli et al](https://peerj.com/articles/13821).

| Dataset  | Name | Description | Intended Use |tsv name | Primer Set | Reference
| ------------- | ------------- | ------------- | ------------- | ------------- | ----------| ------------- |
| 1 | Boston Outbreak   | A cohort of 63 samples from a real outbreak with three introductions, Illumina platform, metagenomic approach  | To understand the features of virus transmission during real outbreak setting, metagenomic sequencing   | [sars-cov-2-SNF-A.tsv](/datasets/sars-cov-2-SNF-A.tsv) | NA |[Lemieux et al.](https://www.science.org/doi/10.1126/science.abe3261)
| 2 | CoronaHiT rapid   | A cohort of 39 samples prepared by different wet-lab approaches and sequenced at two platforms (Illumina vs MinIon) with MinIon running for 18 hrs, amplicon-based approach  | To verify that a bioinformatics pipeline finds virtually no differences between platforms of the same genome, outbreak setting  | [sars-cov-2-coronahit-rapid.tsv](/datasets/sars-cov-2-coronahit-rapid.tsv) | ARTIC_V3|[Baker et al.](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-021-00839-5)
| 3 | CoronaHiT routine | A cohort of 69 samples prepared by different wet-lab approaches and sequenced at two platforms (Illumina vs MinIon) with MinIon running for 30 hrs, amplicon-based approach  | To verify that a bioinformatics pipeline finds virtually no differences between platforms of the same genome, routinue surveillance  | [sars-cov-2-coronahit-routine-a.tsv](/datasets/sars-cov-2-coronahit-routine-a.tsv), [sars-cov-2-coronahit-routine-b.tsv](/datasets/sars-cov-2-coronahit-routine-b.tsv) | ARTIC_V3|[Baker et al.](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-021-00839-5)
| 4 | VOI/VOC lineages  | A cohort of 16 samples from 10 representative CDC defined VOI/VOC lineages as of 06/15/2021, Illumina platform, amplicon-based approach  | To benchmark lineage-calling bioinformatics pipeline especially for VOI/VOCs, bioinformatics pipeline validation  | [sars-cov-2-voivoc.tsv](/datasets/sars-cov-2-voivoc.tsv) | ARTIC_V3 | [Xiaoli et al](https://peerj.com/articles/13821)
| 5 | Non-VOI/VOC lineages | A cohort of 39 samples from representative non VOI/VOC lineages as of 05/30/2021, Illumina platform, amplicon-based approach | To benchmark lineage-calling pipeline nonspecific to VOI/VOCs, bioinformatics pipeline validation  | [sars-cov-2-nonvoivoc.tsv](/datasets/sars-cov-2-nonvoivoc.tsv) | ARTIC_V3: 34,  ARTIC_V1: 2, RandomPrimer-SSIV_NexteraXT: 2,  NA: 1| [Xiaoli et al](https://peerj.com/articles/13821)
| 6 | Failed QC | A cohort of 24 samples failed basic QC metrics, covering 8 possible failure scenarios, Illumina platform, amplicon-based approach  | To serve as controls to test bioinformatics quality control cutoffs | [sars-cov-2-failedQC.tsv](/datasets/sars-cov-2-failedQC.tsv) | ARTIC_V3: 5, CDC in house multiplex PCR primers ([Paden et al.](https://wwwnc.cdc.gov/eid/article/26/10/20-1800_article)): 19| [Xiaoli et al](https://peerj.com/articles/13821)

### GMI

Global Microbial Identifier

| Dataset  | Name | Description | Intended Use |tsv name | Reference |
| ------------- | ------------- | ------------- | ------------- | ------------- | ----------| 
| 1        | Ahrenfeldt E. coli | An evolution experiment | phylogenomic pipeline validation | [e.coli-Ahrenfeldt-dataset.tsv](/datasets/e.coli-Ahrenfeldt-dataset.tsv) | [PMC5217230](https://pubmed.ncbi.nlm.nih.gov/28056767) |
| 2        | Legionella outbreak | Philadelphia 1976 Legionaire's outbreak | Outbreak dataset | [PA_76_benchMarkInfo.tsv](/datasets/PA_76_benchMarkInfo.tsv) | [DOI/10.1371](https://doi.org/10.1371/journal.pone.0164074) |


## Installation & Usage

### Other installation methods

Some methods of installation are maintained by the community.
Although we do not have direct control over them, we would like to list them for convenience.

Visit [INSTALL.md](INSTALL.md) for these methods.

### From Source Code

Grab the latest stable release under the releases tab.  If you are feeling adventurous, use `git clone`!  Include the scripts directory in your path.  For example, if you downloaded this project into your local bin directory:

    $ export PATH=$PATH:$HOME/bin/datasets/scripts

Additionally, ensure that you have the [NCBI API key](https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities).
This key associates your edirect requests with your username.
Without it, edirect requests might be buggy.
After obtaining an NCBI API key, add it to your environment with

    export NCBI_API_KEY=unique_api_key_goes_here

where `unique_api_key_goes_here` is a unique hexadecimal number with characters from 0-9 and a-f. 
You should also set your email address in the 
`EMAIL` environment variable as edirect tries to guess it, which is an error prone process.
Add this variable to your environment with

    export EMAIL=my@email.address
 
using your own email address instead of `my@email.address`.

#### Dependencies

In addition to the installation above, please install the following.

1. edirect (see section on edirect below)
2. sra-toolkit, built from source: https://github.com/ncbi/sra-tools/wiki/Building-and-Installing-from-Source
3. Perl 5.12.0
4. Make
5. wget - Brew users: `brew install wget`
6. sha256sum - Linux-based OSs should have this already; Other users should see the relevant installation section below.

#### Installing edirect

Modified instructions from https://www.ncbi.nlm.nih.gov/books/NBK179288/

    sh -c "$(curl -fsSL ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"

**NOTE**: edirect needs an NCBI API key.
Instructions can be found at https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities

#### Installing sha256sum

If you do not have sha256sum (e.g., if you are on MacOS), then try to make the shell function and export it.

    function sha256sum() { shasum -a 256 "$@" ; }
    export -f sha256sum

This shell function will need to be defined in the current session. To make it permanent for future sessions, add it to `$HOME/.bashrc`.

## Downloading a dataset

### Stable

To run, you need a dataset in tsv format.  Here is the usage statement:

    Usage: GenFSGopher.pl -o outdir spreadsheet.dataset.tsv
    PARAM        DEFAULT  DESCRIPTION
    --outdir     <req'd>  The output directory
    --compressed          Compress files after finishing hashsum verification
    --format     tsv      The input format. Default: tsv. No other format
                          is accepted at this time.
    --layout     onedir   onedir   - Everything goes into one directory
                          byrun    - Each genome run gets its separate directory
                          byformat - Fastq files to one dir, assembly to another, etc
                          cfsan    - Reference and samples in separate directories with
                                     each sample in a separate subdirectory
    --shuffled   <NONE>   Output the reads as interleaved instead of individual
                          forward and reverse files.
    --norun      <NONE>   Do not run anything; just create a Makefile.
    --numcpus    1        How many jobs to run at once. Be careful of disk I/O.
    --citation            Print the recommended citation for this script and exit
    --version             Print the version and exit
    --help                Print the usage statement and die

### Future

We are making the new method for downloading a dataset out of `Make`.
To run this workflow and download the data, make a blank directory and copy over two files like so.

```bash
# Change these variables to your liking
OUTDIR="toy-dataset.out"
DATASET="dataset/toy-bacteria-saureus.tsv"
NUMCPUS=4

mkdir $OUTDIR
cp -v $DATASET $OUTDIR/in.tsv
cp -v scripts/Makefile.template $OUTDIR/Makefile
make -j $NUMCPUS -C $OUTDIR all
```

This is an approximate flowchart of how the Makefile works

```mermaid
graph BT;
    prefetch[prefetch.done]
    sha256sumLog((sha256sum.log))
    sha256sumLogBak((sha256sum.log.bak))
    fastqDump{{fastq-dump}}
    edirect{{edirect}}
    IN([in.tsv])
    SRA((SRA file))
    R1((R1))
    R2((R2))
    R1hashsum((R1.sha256))
    R2hashsum((R2.sha256))
    fasta((fasta\nassembly))
    fastahashsum((fasta.sha256))
    sha256sum{sha256sum}
    tree((tree.dnd))

    IN --> |prefetch| SRA
    SRA --> prefetch
    prefetch -.-> R1
    R1 -.-> R2
    R1 -.-> R1hashsum
    R2 -.-> R2hashsum
    IN --> R1hashsum
    IN --> R2hashsum
    IN --> fastahashsum
    IN --> tree

    SRA --> fastqDump
    fastqDump --> R1
    fastqDump --> R2

    edirect --> fasta
    fasta -.-> fastahashsum

    fastahashsum --> sha256sum
    R1hashsum --> sha256sum
    R2hashsum --> sha256sum

    sha256sum --> |success| sha256sumLog
    sha256sum --> |fail| sha256sumLogBak
```

## Using a dataset

There is a field `intendedUse` which suggests how a particular dataset might be used.  For example, Epi-validated outbreak datasets might be used with a SNP-based or MLST-based workflow.  As the number of different values for `intendedUse` increases, other use-cases will be available.  Otherwise, how you use a dataset is up to you!

## Creating your own dataset
To create your own dataset and to make it compatible with the existing script(s) here, please follow these instructions.  These instructions are subject to change.

Start by creating a new Excel spreadsheet with only one tab. Please delete any extraneous tabs to avoid confusion.
Then view the [specification](SPECIFICATION.md).

## Citation

If this project has helped you, please cite both this website and the relevant study(ies) in the table(s) above.

The original publication can be found in 

Timme, Ruth E., et al. "Benchmark datasets for phylogenomic pipeline validation, applications for foodborne pathogen surveillance." PeerJ 5 (2017): e3893.

---
## Notices and Disclaimers

### Public Domain
This repository constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105. This repository is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/). All contributions to this repository will be released under the CC0 dedication. By submitting a pull request you are agreeing to comply with this waiver of
copyright interest.

### License

Unless otherwise specified, the repository utilizes code licensed under the terms of the Apache Software License and therefore is licensed under ASL v2 or later.

This source code in this repository is free: you can redistribute it and/or modify it under the terms of the Apache Software License version 2, or (at your option) any later version.

This source code in this repository is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the Apache Software License for more details.

You should have received a copy of the Apache Software License along with this program. If not, see http://www.apache.org/licenses/LICENSE-2.0.html

Any source code forked from other open source projects will inherit its license.

### Privacy

This repository contains only non-sensitive, publicly available data and information. All material and community participation is covered by the [Disclaimer](https://github.com/CDCgov/template/blob/master/DISCLAIMER.md) and [Code of Conduct](https://github.com/CDCgov/template/blob/master/code-of-conduct.md).For more information about CDC's privacy policy, please visit [http://www.cdc.gov/other/privacy.html](https://www.cdc.gov/other/privacy.html).

### Contributing

Anyone is encouraged to contribute to the repository by [forking](https://help.github.com/articles/fork-a-repo) and submitting a pull request. (If you are new to GitHub, you might start with a [basic tutorial](https://help.github.com/articles/set-up-git).) By contributing to this project, you grant a world-wide, royalty-free, perpetual, irrevocable, non-exclusive, transferable license to all users under the terms of the [Apache Software License v2](http://www.apache.org/licenses/LICENSE-2.0.html) or later.

All comments, messages, pull requests, and other submissions received through CDC including this GitHub page may be subject to applicable federal law, including but not limited to the Federal Records Act, and may be archived. Learn more at [http://www.cdc.gov/other/privacy.html](http://www.cdc.gov/other/privacy.html).

More specific instructions can be found at [CONTRIBUTING.md](CONTRIBUTING.md).

### Records

This repository is not a source of government records, but is a copy to increase collaboration and collaborative potential. All government records will be published through the [CDC web site](http://www.cdc.gov).
