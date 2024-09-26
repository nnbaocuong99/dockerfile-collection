#!/usr/bin/env perl

use strict;
use warnings;
use v5.30;
use Test::More;

# Function to test
sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

# Test cases
is(add(1, 1), 2, 'Adding 1 + 1');
is(add(-1, 1), 0, 'Adding -1 + 1');
is(add(0, 0), 0, 'Adding 0 + 0');

# Floating point addition
my $result = add(0.1, 0.2);
ok(abs($result - 0.3) < 1e-6, 'Adding 0.1 + 0.2 approximately equals 0.3');

done_testing();

# Run tests using: perl test_script.pl
