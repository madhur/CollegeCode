#!/usr/bin/perl
use warnings;
use strict;

my @files=`dir /B`;
my $curdir=`cd`;

open INDX,">index.html" or die "Unable to Create File";

print INDX <<END;
<html>
<head>
<title>index of $curdir</title>
</head>
<body>

<h1>index of $curdir</h1>
<h4>File Generated By $0</h4>
<h4><I>Developed By Madhur - madhur_ahuja\@yahoo.com</I><h4>
END


foreach my $file(@files)
{
	chomp $file;
	print INDX "<p>";
	print INDX "<a href=$file>$file</a>";
	print INDX "\n";
}

print INDX <<END;
</body>
</html>
END

close INDX;
