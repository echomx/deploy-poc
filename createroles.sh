

#!/bin/bash
[ ! $1 ] &&  echo "please create it with a role name" && exit -1
for i in files templates tasks handlers vars defaults meta
do
    mkdir -p roles/$1/$i
done

