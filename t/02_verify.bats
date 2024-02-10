#!/usr/bin/env bats

# https://github.com/bats-core/bats-core

load "inc/environment"

BATS_SUITE_TMPDIR=${BATS_SUITE_TMPDIR:="./tmp"}
mkdir -pv $BATS_SUITE_TMPDIR

function note(){
  echo "# $@" >&3 2>&3
  stdbuf -i0 -o0 -e0 echo -ne "" >&3
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

@test "verify dataset" {
  if [[ -z "$DATASET" ]]; then
    note "No dataset was found in the environment variable DATASET"
    false
  fi

  # Split the dataset into just 2 genomes each
  # to parallelize it really well and to test multiple genomes per dataset
  chunkSize=2
  note "Splitting DATASET $DATASET into chunks of $chunkSize samples"
  samples=$(grep -A 9999 -i biosample_acc "$DATASET" | tail -n +2)
  numSamples=$(echo "$samples" | wc -l)
  note "Number of samples: $numSamples";
  header=$(grep -B 99 -i biosample_acc "$DATASET")

  # Chunk all samples into different files with prefix TMPDATASET_
  echo "$samples" | split -l $chunkSize - TMPDATASET_
  chunks_counter=0
  for samplesfile in TMPDATASET_*; do
    chunks_counter=$((chunks_counter+1))

    note "Creating working directory"
    note `cp -v $BATS_TEST_DIRNAME/../scripts/Makefile.template $BATS_SUITE_TMPDIR/Makefile`

    # Make a file in.tsv that has the header and the samples
    DATASET_CHUNK=$BATS_SUITE_TMPDIR/in.tsv
    echo "$header" > $DATASET_CHUNK
    cat $samplesfile >> $DATASET_CHUNK

    note "analysis on chunk $chunks_counter"
    note `cat in.tsv`
    note ' '
    note `make -C $BATS_SUITE_TMPDIR MANIFEST`
    target=$(cat $BATS_SUITE_TMPDIR/MANIFEST);
    note "$target"
    note ""

    # Cheat the makefile a bit by making it believe prefetching is all completed
    touch $BATS_SUITE_TMPDIR/prefetch.done
    run make --debug -j $NUMCPUS -C $BATS_SUITE_TMPDIR sha256.verification
    note "$output"
    if [ "$status" -ne 0 ]; then
      note "ERROR with make sha256.verification"
      false
    fi

    # If running this locally, give a chance to ctrl-C
    if [ -z "$CI" ]; then
      note "About to delete the tmp dir $BATS_SUITE_TMPDIR"
      note "Ctrl-C to prevent the deletion"
      sleep 5
    fi

    note `rm -rvf $BATS_SUITE_TMPDIR/*`
    note ' '
  done
  note `rm -vf TMPDATASET_*`
}

