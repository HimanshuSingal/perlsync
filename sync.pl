#!/usr/bin/perl

$dir1 = @ARGV[0];
$dir2 = @ARGV[1];
print "$dir2\n";

$dir1 =~ s! !\\ !g;
$dir2 =~ s! !\\ !g;

print "$dir2\n";
sub searchFile{
    my $dir1 = $_[0];
    my $dir2 = $_[1];
     foreach(`ls -l $dir1`){
	my $d = substr($_,0,1);
	if ($d eq 'd'){
	    my @dnew = split(' ');
	    my $dirn1 = $dir1.'/'.@dnew[8];
            my $dirn2 = $dir2.'/'.@dnew[8];
	    my $i = 9;
	    my $cnt = @dnew;
	    while($i < $cnt)
	    {
		$dirn1 = $dirn1."\\ @dnew[$i]";
                $dirn2 =$dirn2."\\ @dnew[$i]";
 
		$i=$i+1;
	    }
	    my $tdir = $dirn2;
	    $tdir =~ s!\\ ! !g;
         if( -d $tdir)
{
    searchFile($dirn1,$dirn2);
}
else{
     `mkdir $dirn2`;
    `cp -r -p $dirn1/*  $dirn2` ;
     print "$dirn1\n";
}
	}
	if($d eq '-')
	{
	    my @dnew = split(' ');
            my $file1 = $dir1.'/'.@dnew[8];
	    my $file2 = $dir2.'/'.@dnew[8];
	 
            my $i = 9;
	    my $cnt = @dnew;
	    while($i < $cnt)
	    {
		$file1 = $file1."\\ @dnew[$i]";
		$file2 = $file2."\\ @dnew[$i]";
		$i=$i+1;
	    }
 my $tdir = $file2;
	    $tdir =~ s!\\ ! !g;
        
 if( -e $tdir)
{
    my $t1 = `stat -c%Y $file1`;
    my $t2 = `stat -c%Y $file2`;
  #  print "$file1 $t1 $t2 \n";
if(($t1-$t2)>0)
{
    `cp -p $file1 $file2`  ;
     print "$file1\n";
 
    
}
}
else{
    
     `cp -p $file1 $file2` ;
     print "$file1\n";

}
	    
	}
    }
}

searchFile($dir1,$dir2);
searchFile($dir2,$dir1);

