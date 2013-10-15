#!/usr/bin/perl -w


use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);

print header, start_html('Lab 11');
warningsToBrowser(1);

if (!param("username")) {
    getUsername();
} elsif (param("username")){
    $username = param("username");
    getPassword();
}

if (param("password")) {
    $password = param("password");
    $username = param("username");
    authenticate($username, $password);
}


print end_html;

sub getUsername {
print <<eof;
<form method="post" action="$ENV{SCRIPT_URI}">
Enter username: <input type="text" name="username">
</form>
<p>
eof
}

sub getPassword {
print <<eof;
<form method="post" action="$ENV{SCRIPT_URI}">
Enter password: <input type="text" name="password">
                <input type="hidden" name="username" value="$username">
</form>
<p>
eof
}

sub authenticate($) {
if (validPassword()) {
print <<eof;
You are authenticated.
eof
} else {
print <<eof;
Incorrect username or password for $username :: $password ($pwd).
eof
}
}

sub validPassword {
    open (F, "users/$username.password") or die;
    chomp;    
    $pwd = <F>;
    close F;
    return ("$pwd" eq "$password");
}
