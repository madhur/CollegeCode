#!c:/perl/bin/perl.exe

print("content-type:text/html\n\n");

print("<img src=c:/site/programming/images/madhur.jpg>");



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
