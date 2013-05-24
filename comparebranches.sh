#!/bin/sh
MASTER=master
TAGS=$(git branch -a|grep -v $MASTER)
MY_CNT=9999999999999
MY_TAG=""
for TAG in $TAGS
do
  echo "Testing $TAG";
  CNT=$(git diff $MASTER $TAG | wc -l);
  if [ $CNT -le $MY_CNT ];
  then
    echo "Better match: $TAG ($CNT)";
    MY_TAG=$TAG
    MY_CNT=$CNT
  fi
done

echo "Best match found at $MY_TAG with $MY_CNT changed lines"
