#!/usr/bin/perl

$file = $ARGV[0];

$dir = $ARGV[1];


if($file !~ /geojsonl/){

	print "Input file must be a geojsonl file.\n";
	exit;
}

if(!-d $dir){
	print "Directory $dir doesn't exist.\n";
	exit;
}


open(FILE,$file);
while (my $line = <FILE>) {
    chomp $line;
	if($line =~ /\"$dir\":\s*"([^\"]*)"/i){
		$id = $1;
		$line =~ s/([0-9]), ([0-9\-\+])/$1,$2/g;
		$line =~ s/ \], \[ /\]\,\[/g;
		$line =~ s/\"([,\:]) \"/\"$1\"/g;
		$line =~ s/\[ \[ ?/\[\[/g;
		$line =~ s/\] \] ?/\]\]/g;
		$line =~ s/([\{\[]) \"/$1\"/g;
		$line =~ s/\": ([\{\[])/\":$1/g;
		open(BIT,">",$dir."/".$id.".geojsonl");
		print BIT $line;
		close(BIT);
	}
}
close(FILE);
