#!/usr/bin/env bats

# https://github.com/bats-core/bats-core

load "inc/environment"

BATS_SUITE_TMPDIR=${BATS_SUITE_TMPDIR:="./tmp"}
mkdir -pv $BATS_SUITE_TMPDIR

function note(){
  echo "# $@" >&3
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

  note "Creating working directory"
  note `cp -v $BATS_TEST_DIRNAME/../scripts/Makefile.template $BATS_SUITE_TMPDIR/Makefile`
  note `cp -v $DATASET $BATS_SUITE_TMPDIR/in.tsv`
  note `make -C $BATS_SUITE_TMPDIR MANIFEST`
  target=$(cat $BATS_SUITE_TMPDIR/MANIFEST);

  # basically make one target at a time
  for t in $target; do
    note "Making target: $t"
    make -C $BATS_SUITE_TMPDIR $t
  done

  rm -vr $BATS_SUITE_TMPDIR/*
}

