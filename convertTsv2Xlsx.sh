#!/usr/bin/env bash
set -x 
export job_num=8
cat > convert.py <<EOF 
import csv
import sys
from xlsxwriter.workbook import Workbook
# File name
tsv_file = sys.argv[1]
xlsx_file = sys.argv[2]
# Create an XlsxWriter workbook object and add a worksheet.
workbook = Workbook(xlsx_file)
worksheet = workbook.add_worksheet()

#  Create a TSV file reader.
# tsv_reader = csv.reader(opent(tsv_file, 'rb'), delimiter='\t') # py27
tsv_reader = csv.reader(open(tsv_file, 'rt'), delimiter='\t') # py3

# Read the row data from the TSV file and write it to the XLSX file.
for row, data in enumerate(tsv_reader):
    worksheet.write_row(row, 0, data)

# Close the xlsx file.
workbook.close()
EOF

Convert () {
    tsv=$1
    xlsx=${tsv/.tsv/.xlsx}
    python convert.py $tsv $xlsx
}
export -f Convert 
ls *tsv | parallel -j $job_num Convert