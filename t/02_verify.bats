#!/usr/bin/env bats

# https://github.com/bats-core/bats-core


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

  note "Creating working directory"
  note `cp -v $BATS_TEST_DIRNAME/../scripts/Makefile.template $BATS_SUITE_TMPDIR/Makefile`
  note `cp -v $DATASET $BATS_SUITE_TMPDIR/in.tsv`
  note `make -C $BATS_SUITE_TMPDIR MANIFEST`
  target=$(cat $BATS_SUITE_TMPDIR/MANIFEST);
  note "$target"
  note ""

  run make -j $NUMCPUS -C $BATS_SUITE_TMPDIR sha256.verification
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

  rm -vr $BATS_SUITE_TMPDIR/*
}

