#!/usr/bin/perl -w


use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);

print header, start_html('A Simple Example');
warningsToBrowser(1);

if (!defined param("num")) {
	$num = 50;
} elsif (defined param("higher")) {
    $num = $num + (100-$num);
}

param('highest', $hidden_highest);
param('lowest', $hidden_lowest);
param('current', $hidden_current);

print h2,
      start_form,
      "$num?",
      hidden('$hidden_current'),
      submit('higher'),
      submit('lower'),
      submit('yes'),
      end_form,
      end_html;
