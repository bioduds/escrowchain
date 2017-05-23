use v6;
use lib 'lib/core';
use master;
use genesis;

print "Initializing Proceedures...\nWelcome to EscrowChain\n";

Core::Config.start;
my $genesis = Core::Genesis.new;
$genesis.say-hello-from-genesis;

print "+++ end +++\n";
