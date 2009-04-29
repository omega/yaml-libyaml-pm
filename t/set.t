use utf8;
use t::TestYAMLTests tests => 1;

use Devel::Peek qw/Dump/;

use Set::Object;

filters {
    perl => 'eval',
    yaml => 'load_yaml',
};

my $test = get_block_by_name("!!set test");


#$set->insert('Test 1');
#$set->insert('Test 2');
#$set->insert('Test 3');

my $hash = { tests => Set::Object->new };
#my $hash = $test->perl;
my $hash2 = $test->yaml;

Dump($hash->{tests});

Dump($hash2->{tests});
#is_deeply $hash2, $hash, "Load " . $test->name;

__DATA__
=== !!set test
+++ yaml
tests: !!set
    ? Test 1
    ? Test 2
    ? Test 3
+++ perl
+{ tests => '' };
+++ yaml_dump
---
tests: !!set
    ? Test 1
    ? Test 2
    ? Test 3
