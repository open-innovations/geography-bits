#!/usr/bin/perl

use JSON::XS;
use utf8;

$file = $ARGV[0];
$dir = $ARGV[1];
$precision = 5;


if(!-e $file || $file !~ /\.geojson$/){
	print "Input file must be a geojson file.\n";
	print "Usage: perl process.pl <GeoJSON file> <code>\n";
	exit;
}

if(!$dir){
	print "Please provide an ONS code as the second argument.";
	print "Usage: perl process.pl <GeoJSON file> <code>\n";
	exit;
}

# Create directories if they don't exist
if(!-d $dir){
	`mkdir $dir`;
	if(!-d $dir."/temp/"){
		`mkdir $dir/temp/`;
	}
}

$out = "";
open(FILE,$file);
while(<FILE>){
	$line = $_;
	if($line =~ /"type":\s+"Feature"/){
		$line =~ s/\,$//g;
		$json = JSON::XS->new->decode($line);
		$jsonl = "";
		$cc = "";
		if($json->{'geometry'}{'coordinates'}){
			@coord = @{$json->{'geometry'}{'coordinates'}};
			$ni = @coord;
			$cc .= "[";
			for($i = 0; $i < $ni; $i++){
				$nj = @{$coord[$i]};
				$cc .= ($i > 0 ? ",":"")."[";
				for($j = 0; $j < $nj; $j++){
					$nk = @{$coord[$i][$j]};
					$cc .= ($j > 0 ? ",":"")."[";
					if($json->{'geometry'}{'type'} eq "MultiPolygon"){
						for($k = 0; $k < $nk; $k++){
							$cc .= ($k > 0 ? ",":"")."[";
							$cc .= sprintf('%.'.$precision.'f', $coord[$i][$j][$k][0]).",".sprintf('%.'.$precision.'f', $coord[$i][$j][$k][1]);
							$cc .= "]";
						}
					}else{
						$cc .= sprintf('%.'.$precision.'f', $coord[$i][$j][0]).",".sprintf('%.'.$precision.'f', $coord[$i][$j][1]);
					}
					$cc .= "]";
				}
				$cc .= "]";
			}
			$cc .= "]";
		}
		foreach $prop (keys(%{$json->{'properties'}})){
			if($prop !~ /^[A-Za-z]+[0-9]{2}(CD|NM)/){
				delete $json->{'properties'}{$prop};
			}
			if($json->{'properties'}{$prop} eq "" || $json->{'properties'}{$prop} eq " "){
				delete $json->{'properties'}{$prop};
			}
		}
		$jsonl .= "{ \"type\": \"Feature\", \"properties\": { ";
		$p = "";
		foreach $prop (sort(keys(%{$json->{'properties'}}))){
			$p .= ($p ? ", ":"")."\"$prop\": \"$json->{'properties'}{$prop}\"";
		}
		$jsonl .= $p;
		$jsonl .= " }, \"geometry\": { \"type\": \"$json->{'geometry'}{'type'}\", \"coordinates\": $cc }";
		$jsonl .= "}\n";

		if($json->{'properties'}{$dir}){
			$id = $json->{'properties'}{$dir};
			open(BIT,">",$dir."/".$id.".geojsonl");
			print BIT $jsonl;
			close(BIT);
		}
		$out .= $jsonl;
	}
}
close(FILE);

open(JSON,">","$code/temp/$code.geojsonl.json");
print JSON $out;
close(JSON);

print "Done.\n";