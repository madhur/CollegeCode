#!c:/perl/bin/perl.exe
print("content-type:text/html\n\n");

&header("counter example");


	open(CFILE,"counter.txt") ||print("error");;
	$number=<CFILE>;
	print("<b>This page has been accessed : $number times\n");
	close(CFILE);
	


while(-e "lock.txt")
{
	sleep 3;
}
	open(LOCKFILE,"lock.txt");
	close(LOCKFILE);
	$number=$number+1;
	open(CFILE,">counter.txt") || print("error1");
	print CFILE ($number);
	close(CFLILE);
	unlink("lock.txt");


&endhead;



sub header
{
	my($title)=@_;
	print("<html>\n");
	print("<head><title>$title</title></head>\n");
	print("<body>\n");
}

sub endhead
{
	print("</body>\n");
	print("</html>\n");
}