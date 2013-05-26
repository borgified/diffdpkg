#!/usr/bin/env perl

#open(TRAVIS,"travis.txt");
open(TRAVIS,"travis2.txt");
open(NODE01,"node01.txt");

my %travis;
my %node01;

while(defined(my $line=<TRAVIS>)){
	chomp($line);
	my($pkg_name,$version)=split(/\s+/,$line);
	$travis{$pkg_name}=$version;
}

while(defined(my $line=<NODE01>)){
	chomp($line);
	my($pkg_name,$version)=split(/\s+/,$line);
	$node01{$pkg_name}=$version;
}

&a; #check for items that are only in travis
&b; #check for items that are only in node01

sub a {
	foreach my $item (keys %travis){
		if(exists($node01{$item})){
			if($travis{$item} eq $node01{$item}){
			}else{
				print "$item: both: travis($travis{$item}) node01($node01{$item})\n";
			}
		}else{
			print "$item: only in travis\n";
		}
	}
}
#####################################

sub b {
	foreach my $item (keys %node01){
		if(exists($travis{$item})){
			if($travis{$item} eq $node01{$item}){
			}else{
				#dont need to print this since we already got this case the first time around
				#print "$item: both: travis($travis{$item}) node01($node01{$item})\n";
			}
		}else{
			print "$item: only in node01\n";
		}
	}
}

