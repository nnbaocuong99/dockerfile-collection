# RUNTIME file for Perl

use strict;
use warnings;

# Set environment variables
$ENV{'APP_ENV'} = 'production';

# Main application logic
sub main {
    print "Perl Runtime Environment\n";
    print "Perl version: $]\n";
    print "Current working directory: ", `pwd`;

    # Add your application logic here
    # For example:
    # require 'my_app.pl';
    # run_app();
}

main();
