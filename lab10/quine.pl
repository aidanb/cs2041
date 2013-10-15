#!/usr/bin/perl -w

printfunc(q{

    sub printfunc {
      print "#!/usr/bin/perl -w\n\n";
      print "printfunc(q{$_[0]});\n";
      print "$_[0]";
    }

});

sub printfunc {
  print "#!/usr/bin/perl -w\n\n";
  print "printfunc(q{$_[0]});\n";
  print "$_[0]";
}


