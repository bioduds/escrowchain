use v6;
use lib 'lib/network';
use lib 'lib/grammars';
use reader;

say "Running Test...";

await IO::Socket::Async.connect('localhost', 5000).then( -> $p {
    if $p.status {
        given $p.result {
            .print('Hello, Perl 6');
            react {
                whenever .Supply() -> $v {
                    $v.say;
                    done;
                }
            }
            .close;
        }
    }
});


# my $conn = IO::Socket::INET.new(:host<localhost>, :port(5000));
# $conn.print: 'Hello, Perl 6';
# say $conn.recv;
# $conn.close;

# my $listen = IO::Socket::INET.new(:listen, :localhost<localhost>, :localport(5000));
#
# loop {
#     my $conn = $listen.accept;
#     while my $buf = $conn.recv(:bin) {
#         $conn.write: $buf;
#     }
#     $conn.close;
# }

#`{
my $r = EC::Network::Reader.new(
  :message( "Hello, I am 12.12.12.12 and my version is 21.21.21 at Sáb Jun 10 11:23:59 BRT 2017" ) ).read;
}

#`{
my $addr = EC::Grammars::ADDR.new.parse(
  'Right now, Sex Jun  9 09:23:35 BRT 2017 I have 154.54.78.96 56.21.147.10',
  :actions( EC::Grammars::ADDR::Actions.new )
);
}

#`{
my $v = EC::Grammars::VERACK::Greetings.new.parse(
'Hello, I am 12.12.12.12 and my version is 21.21.21',
:actions( EC::Grammars::VERACK::Greetings::Actions.new )
);
}


#$v.respond( :node( $v<NODE> ) );

#`{
my $master = EC::P2P::Master.new;
$master.awake;
$master.connect;
}

#`{
say "Testing Hashcash";
my $hashcash = EC::PoW::Hashcash.new( :prev-hash( "JqV@Tyq2SnUuNb=QpwKUPPeL0V" ) );
$hashcash.mine( :nonce-size(25), :difficulty(2) );
}
