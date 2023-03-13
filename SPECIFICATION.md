# Dataset specification

The dataset specification describes a set of data that can be downloaded
and some information about the data being downloaded.
For example, what outbreak code it belongs to.

The spreadsheet for the dataset is also meant to be read by a script
`GenfsGopher.pl` so that it can all be automatically downloaded.

## Detailed fields

The spreadsheet is divided into two parts:
1) the information describing the whole dataset and 
2) the information describing each sample.

### Whole dataset information

The first part describes the dataset.
This is given as a two-column key/value format.
The keys are case-insensitive, but the values are case-sensitive.  The order of rows is unimportant.

| Field        | Description |
| ------------ | ----------- |
| Organism     | Usually genus and species, but there is no hard rule at this time. |
| Outbreak     | This is usually an outbreak code but can be some other descriptor of the dataset. |
| pmid         | Any publications associated with this dataset should be listed as pubmed IDs. |
| tree         | This is a URL to the newick-formatted tree.  This tree serves as a guide to future analyses. |
| source       | Where did this dataset come from? |
| intendedUsage| How do you think others will use this dataset? |

### blank row

There is a blank row in the spreadsheet here

### Header row

Header row with field names in the following section such as `biosample_acc`.
Not all fields are required.
These field names are case insensitive and can be in any order.

### Sample information

| Field         | Required? | Description | example    |
| ------------- | --------- | ----------- | ---------- |
| `biosample_acc` |     [x] | The BioSample accession | SAMN012345 |
| `strain`      |       [x] | The name of the genome or strain | |


5. Sample info.  Each row represents a genome and must have the following fields.  Use a dash (-) for any missing data.
    1. biosample_acc - The BioSample accession
    2. strain - Its genome name
    3. genbankAssembly - GenBank accession number
    4. SRArun_acc - SRR accession number
    5. outbreak - The name of the outbreak clade.  Usually named after an outbreak code.  If not part of an important clade, the field can be filled in using 'outgroup'
    6. dataSetName - this should be redundant with the outbreak field in the first part of the spreadsheet
    7. suggestedReference - The suggested reference genome for analysis, e.g., SNP analysis.
    8. sha256sumAssembly - A checksum for the GenBank file
    9. sha256sumRead1 - A checksum for the first read from the SRR accession
    10. sha256sumRead2 - A checksum for the second read from the SRR accession
    11. nucleotide - A single nucleotide accession. This is sometimes an alternative to an assembly especially for one-contig genomes.
    12. sha256sumnucleotide - a checksum for the single nucleotide accession.
    13. amplicon_strategy - which amplicon strategy was used?  E.g., `ARTIC V3`

## Creating hashsums

This specification uses sha256 to calculate hashsums.
To create a hashsum on a file, e.g., file.fastq.gz, run the following

    sha256sum file.fastq.gz

We include a script `adjustHashsums.pl` to help create hashsums automatically in the spreadsheet.
Here are the suggested steps:

1. create the spreadsheet as described above in the detailed fields.
Do not include hashsum values in the relevant fields.
2. Run `GenFSGopher.pl` using your new spreadsheet.
It will err due to incorrect hashsums.
3. A file `in.tsv` should be in the output directory identical to the input file.
4. Run `adjustHashsums.pl` on `in.tsv` to create a file `out.tsv`.
5. `out.tsv` will have correct hashsums.

