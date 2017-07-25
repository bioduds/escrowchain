#unit package EC::Network:auth<github:bioduds>;

unit module EC::Network;

my $conn = IO::Socket::INET.new(:host<localhost>, :port(80));
$conn.print: 'Hello, Perl 6';
say $conn.recv;
$conn.close;

my $listen = IO::Socket::INET.new(:listen, :localhost<localhost>, :localport(80));

loop {
    my $conn = $listen.accept;
    while my $buf = $conn.recv(:bin) {
        $conn.write: $buf;
    }
    $conn.close;
}
