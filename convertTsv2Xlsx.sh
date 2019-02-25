#!/usr/bin/env bash
set +x 
export job_num=8

function usage () {
    echo -e "\033[36m ------------------------\nUsage: $0\n------------------------\n  \033[0m"
    echo -e 'parallel --bar --verbose -j $job_num convert_tsv_2_xlsx {} {.}.xlsx ::: *.tsv'
}

function convert_tsv_2_xlsx () {
    tsv=$1
    xlsx=$2
    if [[ -f "$xlsx" ]]; then
        echo -e "\033[0;36m $xlsx exists \033[0m"
    else
        python - $tsv $xlsx <<-"EOF"
		#!/usr/bin/env python
		# -*- coding:utf-8 -*-
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
    fi
}
export -f convert_tsv_2_xlsx 

function main () {
    usage
    echo -e "\033[0;36m Warning: File name cannot include spaces \033[0m"
    echo -e "\033[1;35m Progressing... \033[0m"
    parallel --bar --verbose -j $job_num convert_tsv_2_xlsx {} {.}.xlsx ::: *.tsv
}

main "$@"