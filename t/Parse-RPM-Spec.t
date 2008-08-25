use Test::More tests => 12;
BEGIN { use_ok('Parse::RPM::Spec') };

eval { my $spec = Parse::RPM::Spec->new(\'t/file.spec') };
ok($@);
like($@, qr/SCALAR/);

ok($spec = Parse::RPM::Spec->new('t/file.spec'));
isa_ok($spec, 'Parse::RPM::Spec');

ok($spec = Parse::RPM::Spec->new({ file => 't/file.spec' }));
isa_ok($spec, 'Parse::RPM::Spec');

is($spec->name, 'perl-Array-Compare');
is($spec->version, '1.16');
$spec->version('1.17');
is($spec->version, '1.17');
is(@{$spec->buildrequires}, 2);
is($spec->buildrequires->[0], 'perl >= 1:5.6.0');