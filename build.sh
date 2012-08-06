#!/usr/bin/env bash
# Usage: $ build.sh -f <formula> -p <prefix> [-x <archive>]

# Syntax sugar.
indent() {
  RE="s/^/       /"
  [ $(uname) == "Darwin" ] && sed -l "$RE" || sed -u "$RE"
}

function puts-step (){
  echo "-----> $@"
}


# Argument parsing.
while getopts ":f:x:p:" opt; do
  case $opt in
    f)
      FORMULA=$OPTARG
      echo "Using formula: $FORMULA" >&2
      # echo "-f was triggered, Parameter: $OPTARG" >&2
      ;;
    p)
      # echo "-p was triggered, Parameter: $OPTARG" >&2
      mkdir -p $OPTARG
      PREFIX_PATH=`cd "$OPTARG"; pwd`
      echo "Using prefix:  $PREFIX_PATH" >&2
      ;;
    x)
      ARCHIVE=$OPTARG
      echo "Using archive: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

if [ ! "$FORMULA" ]; then
    echo "Please specify a valid formula with -f." >&2
    exit 1;
fi

if [ ! "$PREFIX_PATH" ]; then
    echo "Please specify a valid prefix with -p." >&2
    exit 1;
fi


echo "------> Building Formula $FORMULA"
FORMULA_PATH=$(pwd)/formula/$FORMULA

if [ ! -f $FORMULA_PATH ]; then
    echo "Formula '$FORMULA' does not exist." >&2
    exit 1;
fi

$(pwd)/formula/$FORMULA $PREFIX_PATH | indent

if [ "$ARCHIVE" ]; then
    tar cjf $ARCHIVE $PREFIX_PATH
fi