#!/usr/bin/env bats

# https://github.com/bats-core/bats-core

load "inc/environment"

BATS_SUITE_TMPDIR=${BATS_SUITE_TMPDIR:="./tmp"}
mkdir -pv $BATS_SUITE_TMPDIR

function note(){
  echo "# $1" >&3
}

note "DEBUG: resetting bats tmp dir"; export BATS_SUITE_TMPDIR="./tmp"

@test "Environment" {
  note "Looking for executables"
  note "============="
  note `which esearch`
  note `which fastq-dump`
  note `which GenFSGopher.pl`

  note "Looking at environmental variables"
  note "============"
  if [[ -z "$DATASET" ]]; then
    note "No dataset was found in the environment variable DATASET"
    false
  fi
  if [[ -z "$NUMCPUS" ]]; then
    note "NUMCPUS not defined in the environment"
    false
  fi
  note "DATASET: $DATASET"
}

@test "download dataset" {
  if [[ -z "$DATASET" ]]; then
    note "No dataset was found in the environment variable DATASET"
    false
  fi

  # Split the dataset into just 20 genomes each
  chunkSize=4
  note "Splitting DATASET $DATASET into chunks of $chunkSize samples"
  samples=$(grep -A 9999 -i biosample_acc "$DATASET" | tail -n +2)
  numSamples=$(echo "$samples" | wc -l)
  note "Number of samples: $numSamples";
  header=$(grep -B 99 -i biosample_acc "$DATASET")

  note "Header of the sample sheet:"
  note "$header"
  note ""

  # Chunk all samples into different files with prefix TMPDATASET_
  mkdir -p $BATS_SUITE_TMPDIR/chunks
  echo "$samples" | split -l $chunkSize - $BATS_SUITE_TMPDIR/chunks/TMPDATASET_
  chunks_counter=0
  for samplesfile in $BATS_SUITE_TMPDIR/chunks/TMPDATASET_*; do
    # temporary chunk of dataset
    chunks_counter=$((chunks_counter+1))
    # Make a file in.tsv that has the header and the samples
    TMP_DS=$samplesfile.tsv
    echo "$header" > $TMP_DS
    cat $samplesfile >> $TMP_DS
    DATASET=$TMP_DS

    note "GenFSGopher.pl on chunk $chunks_counter"
    note " "
    cat $samplesfile | sed 's/^/# /' >&3
    note " "
    name=$(basename $DATASET)
    CHUNK_OUT=$BATS_SUITE_TMPDIR/$name.out
    run GenFSGopher.pl -o $CHUNK_OUT --numcpus $NUMCPUS $DATASET
    exit_code="$status"
    note "$output"
    note "Independently running sha256sum outside of GenFSGopher.pl"
    find $BATS_SUITE_TMPDIR -type f -exec sha256sum {} \; | sed 's/^/# /' >&3
    find $BATS_SUITE_TMPDIR -name '*.fastq' -or -name '*.gz' | \
      xargs -n 1 bash -c 'echo -ne "$0\t"; cat $0 | sha256sum' | sed 's/^/# /' >&3 || true
    if [ "$exit_code" -gt 0 ]; then
      note "ERROR on GenFSGopher! exit code $exit_code"
      note ""
      note "One last look at hashsums:"
      note `find $BATS_SUITE_TMPDIR -name sha256sum.log.bak -exec cat {} \;`
      note `find $BATS_SUITE_TMPDIR -name '*.sha256sum' -exec grep -H . {} \;`
      # invoke an exit code > 1 with 'false'
      false
      exit 1
    fi
    note "DEBUG: not deleting files pertaining to $name"; # rm -rf $CHUNK_OUT $TMP_DS
  done
  rm $BATS_SUITE_TMPDIR/chunks/TMPDATASET_* -v
}

