# dns-hijack-detection

Populate the file withIPs with a list of your URLs and their expected IP addresses. The file should be space delimited - there should be one URL and at least 1 IP address per line.

The script will iterate over the file and check the return from `host` against all of the values on each line.

All activity is written to the debug file for reference.

Where there is no match, a nomatch file is created and archived off into a logs folder and renamed by date.


TODO:

Add RSS Feed creation functionality
