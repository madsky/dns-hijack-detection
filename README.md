# dns-hijack-detection

Populate the file 'withIPs.txt' with a list of your URLs and their expected IP addresses. The file should be space delimited - there should be one URL and at least 1 IP address per line.

Like this:

www.example.com 1.1.1.1 2.2.2.2

The script will iterate over the file and check the return from `host` against all of the values on each line.

All activity is written to the debug file for reference.

Where there is no match, a nomatch file is created and archived off into a logs folder and renamed by date.

Create a subfolder 'logs' in the directory you're running the script from.

Then add a cron job to run the script periodically.


TODO:

Add RSS Feed creation functionality
