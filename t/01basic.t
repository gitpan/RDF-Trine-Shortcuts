use Test::More tests => 4;
BEGIN { use_ok('RDF::Trine::Shortcuts') };

my $in    = "<http://example.com/s> <http://example.com/p> <http://example.com/o> .\r\n";
my $model = rdf_parse($in);

ok($model->count_statements == 1, "rdf_parse OK");

ok(rdf_query("ASK WHERE { $in }", $model), "rdf_query OK");

ok(rdf_string($model, 'Canonical') eq $in, "rdf_string OK");
