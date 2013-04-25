package CPAN::Documentation::HTML::Entry;
BEGIN {
  $CPAN::Documentation::HTML::Entry::AUTHORITY = 'cpan:GETTY';
}
{
  $CPAN::Documentation::HTML::Entry::VERSION = '0.001';
}

use Moo;

has module => (
	is => 'ro',
	required => 1,
);

has dist => (
	is => 'ro',
	required => 1,
);

# 
# 0 Module
# 1 Documentation
# 2 Script
#

has type => (
	is => 'ro',
	required => 1,
);

has pod => (
	is => 'ro',
	required => 1,
);

1;
__END__
=pod

=head1 NAME

CPAN::Documentation::HTML::Entry

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

