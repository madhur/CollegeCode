#script to convert c style equates to asm style equates
#programmed by madhur ahuja

$file=$ARGV[0];
if($file eq "")
{
	print("Perl Script to convert c equates to asm equates\n");
	print("Coded by Madhur (madhur_ahuja\@yahoo.com\n");
	print("Usage:h2inc [filename]");
	die("\n");
}
	

open(FILEVAR,$file) || die("\nError Opening file $file\n");

@fileout=split(/\./,$file);
open(OUTFILE,">$fileout[0].inc") || die("\nerror");

@line = <FILEVAR>;		#assign whole file to a list
$lines=@line;
print OUTFILE (";File Generated by h2inc\n");
print OUTFILE (";Report any bugs to Madhur Ahuja (madhur_ahuja\@yahoo.com)\n\n\n");

$i=0;
while($i<=@line)
{
	if($line[$i]=~/^[\t ]+/)
	{
		$line[$i]=~s/[\t ]+//;	#remove whitespace at the start of line
	}
	if($line[$i]=~/^#define[\t ]+[_a-z0-9A-Z]+[\t ]+[_a-z0-9A-Z]/)	#since whitespace is removed,#define shud
									# be first word,comments and invalid chars
									#are ignored
			#let #define madhru ahuja
	{
		@words=split(/[\t\n ]+/,$line[$i]);	#("#define","madhur","ahuja")
		#since we have also splitted according to newling, last char doesnt contain newline and we add it manualy
		
		if($words[2]=~/^0x[0-9A-Za-z]+/)	#check if num is of type 0x123
		{
			@words1=split(/x/,$words[2]);       #words1=("0","123")
			print("\n $i @words1");	
			$words[2]="0$words1[1]h";		#words1=123h
		
		}
		
		if(length($words[1])>=8)
		{
			print OUTFILE ("$words[1]\tequ\t\t$words[2]\n");	
		}
		else
		{
			print OUTFILE ("$words[1]\t\tequ\t\t$words[2]\n");	
		}
			
	}
	
	++$i;
}

close(FILEVAR);
close(OUTFILE);
