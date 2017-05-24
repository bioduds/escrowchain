unit class BW::Merkle;
use Digest::SHA;

class Tree {

  has @.dataset;
  has @!line;

  method !set-leaves {
    if ( @.dataset.elems % 2 == 1 ) {
      @.dataset.push( @.dataset.pop );
    }
    @!line = [];
    for @.dataset -> $data {
      my $sha256 = sha256 $data.encode: 'ascii';
      @!line.push( $sha256.list».fmt: "%02x" );
    }
  }

  method get-root {
    self!set-leaves;
    for reverse 1..^self.height -> $h {
      my @current_line = [];
      for @!line -> $a, $b {
        my $sha256 = sha256 ($a~$b).encode: 'ascii';
        @current_line.push( $sha256.list».fmt: "%02x" );
      }
      @!line = @current_line;
    }
    return @!line[0];
  }

  method height {
    return log( @!dataset.elems, 2 ) + 1;
  }

}
