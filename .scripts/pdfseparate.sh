# split pdf
mkdir .tmpdir
pdfseparate -f $1 -l $2 $3 .tmpdir/out-%d.pdf

# join pdf
for (( i = $1; i <= $2; i++ )); do
  files2join+=".tmpdir/out-"$i".pdf "
done
pdfunite $files2join ${4:-output.pdf}
rm -r .tmpdir
