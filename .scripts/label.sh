sed -i "s/{$2sec:/{$1_sec:/g" ${3:-*.tex}
sed -i "s/{$2sub:/{$1_sub:/g" ${3:-*.tex}
sed -i "s/{$2ssub:/{$1_ssub:/g" ${3:-*.tex}
sed -i "s/{$2eq:/{$1_eq:/g" ${3:-*.tex}
sed -i "s/{$2fig:/{$1_fig:/g" ${3:-*.tex}
sed -i "s/{$2app:/{$1_app:/g" ${3:-*.tex}

