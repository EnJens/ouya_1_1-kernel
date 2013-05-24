#!/bin/sh
MASTER=master
#TAGS=$(git rev-list --tags remotes/nvidia/tegra-12r9-android-3.2..remotes/nvidia/tegra-12r10-android-3.2)
TAGS=$(git rev-list --tags nvidia/rel-14r7..nvidia/android-tegra-nv-2.6.39)
MY_CNT=71000
MY_TAG=""
rm -f latest.txt
touch latest.txt
for TAG in $TAGS
do
  echo "Testing $TAG";
  CNT=$(git diff --diff-filter=M $MASTER $TAG | wc -l);
  if [ $CNT -le $MY_CNT ]; 
  then
    echo "Better match: $TAG ($CNT)" >> latest.txt
    MY_TAG=$TAG
    MY_CNT=$CNT
  fi
done

echo "Best match found at $MY_TAG with $MY_CNT changed lines"
