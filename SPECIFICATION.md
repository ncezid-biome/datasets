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

| Field        | Description | Example |
| ------------ | ----------- | ------- |
| Organism     | Usually genus and species, but there is no hard rule at this time. | SARS-CoV-2 |
| Outbreak     | This is usually an outbreak code but can be some other descriptor of the dataset. | 1408MLGX6-3WGS |
| pmid         | Any publications associated with this dataset should be listed as pubmed IDs. |
| tree         | This is a URL to the newick-formatted tree.  This tree serves as a guide to future analyses. | `https://...` |
| source       | Where did this dataset come from? | Cheryl Tarr |
| intendedUsage| How do you think others will use this dataset? | cluster analysis |
| dataType     | A description of the data | Outbreak clade and one outgroup with Illumina only |

### blank row

There is a blank row in the spreadsheet here

### Header row

Header row with field names in the following section such as `biosample_acc`.
Not all fields are required.
These field names are case insensitive and can be in any order.

Extra unnamed fields are discouraged because other fields might be added,
but they will not affect the `GenfsGopher` script from working.

### Sample information

Some fields are required and are marked with :heavy_check_mark:.
Other fields are optional but require `-` if the information is not present. These fields are marked with :eight_spoked_asterisk:.
Other fields are optional and are marked with :negative_squared_cross_mark:. You must use `-` to indicate absence.
Previous versions of this repo allowed for `NA` but in the current version, `-` is required for absent data.

| Field         | Required? | Description | example    |
| ------------- | --------- | ----------- | ---------- |
| `biosample_acc` | :heavy_check_mark:    | The BioSample accession | SAMN012345 |
| `strain`      | :heavy_check_mark:      | The name of the genome or strain | |
|`genbankAssembly`| :eight_spoked_asterisk: | GenBank accession number | GCA_027920385.1 |
|`SRArun_acc`   | :eight_spoked_asterisk: | SRR accession number | SRR012345 |
| `outbreak`    | :negative_squared_cross_mark: | The name of the outbreak clade.  Usually named after an outbreak code.  If not part of an important clade, the field can be filled in using `outgroup` | |
| `dataSetName` | :negative_squared_cross_mark: | this should be redundant with the outbreak field in the first part of the spreadsheet | |
| `suggestedReference` | :negative_squared_cross_mark: | The suggested reference genome for analysis, e.g., SNP analysis. | `TRUE` or `FALSE` |
| `sha256sumAssembly` | :eight_spoked_asterisk: | A checksum for the GenBank file | |
| `sha256sumRead1` | :eight_spoked_asterisk: | A checksum for the first read from the SRR accession | |
| `sha256sumRead2` | :eight_spoked_asterisk: | A checksum for the second read from the SRR accession | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` is a special example of when the second read is blank. |
| `nucleotide` | :eight_spoked_asterisk: | A single nucleotide accession. This is sometimes an alternative to an assembly especially for one-contig genomes. | |
| `sha256sumnucleotide` | :eight_spoked_asterisk: | a checksum for the single nucleotide accession. |  |
| `amplicon_strategy` | :negative_squared_cross_mark: | which amplicon strategy was used? | `ARTIC V3`|
| `AMR_genotype`  | :negative_squared_cross_mark: | The antimicrobial resistance genotype comma separated | `mdsB,mdsA,golT` |
| `Plasmids`    | :negative_squared_cross_mark: | Plasmids present, comma separated | `IncFIB(S),IncFII(S),IncX4` |
| `organism` | :negative_squared_cross_mark: | The scientific name of the sample, or more taxonomic information as needed | Acinetobacter baumannii |

## Creating hashsums

This specification uses sha256 to calculate hashsums.
To create a hashsum on a file, e.g., file.fastq, run the following

    sha256sum file.fastq

We include a script `adjustHashsums.pl` to help create hashsums automatically in the spreadsheet.
Here are the suggested steps:

1. create the spreadsheet as described above in the detailed fields.
Do not include hashsum values in the relevant fields.
2. Run `GenFSGopher.pl` using your new spreadsheet.
It will err due to incorrect hashsums.
3. A file `in.tsv` should be in the output directory identical to the input file.
4. Run `adjustHashsums.pl` on `in.tsv` to create a file `out.tsv`.
5. `out.tsv` will have correct hashsums.

## Example

```tsv
intendedUse	Fast assembly of ONT data									
Organism	Staphylococcus aureus									
source	George Bouras									
pmid	-									
dataType	toy dataset for ONT assembly and AMR									
Outbreak	-									
tree	-									
										
SRArun_acc	biosample_acc	genBankAssembly	nucleotide	outbreak	sha256sumAssembly	sha256sumRead1	sha256sumRead2	sha256sumnucleotide	strain	
-	SAMN32538168	GCA_027920385.1	-	-	-	-	-	-	C308	
SRR22859991	SAMN32360857	-	-	-	-	02d46259b402e83c62b143e96e2dc6761f86b1ac9bd7dfccf9c27f60492afc85	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	-	C113	
SRR22859768	SAMN32360972	-	-	-	-	fe7b008a59b3aadfccbfe5f8325bf79e9933fe6d44e0956d68e74eba6230ad2f	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	-	C347	
```

# Create your own

(future instructions for when `Makefile` is in place)

To create your own, create a spreadsheet with at least the required fields as defined above, e.g., `biosample_acc` and `strain`.
If you include data such as genbankAssembly, then you must have the sha256 accompanying field too such as `sha256sumAssembly`.

For the values of the sha256 fields, use `1` as a placeholder.

Next, run `make all` (this will err due to the sha256sums)
followed by `make dataset.tsv`.

