package CPAN::Documentation::HTML::PodSimple;
BEGIN {
  $CPAN::Documentation::HTML::PodSimple::AUTHORITY = 'cpan:GETTY';
}
{
  $CPAN::Documentation::HTML::PodSimple::VERSION = '0.002';
}
# ABSTRACT: Pod::Simple::XHTML Subclass for CPAN::Documentation::HTML

use Moo;
extends 'Pod::Simple::XHTML';

1;
__END__
=pod

=head1 NAME

CPAN::Documentation::HTML::PodSimple - Pod::Simple::XHTML Subclass for CPAN::Documentation::HTML

=head1 VERSION

version 0.002

=head1 AUTHORS

=over 4

=item *

Torsten Raudssus <torsten@raudss.us>

=item *

Doug Brown <doug@duckduckgo.com>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Torsten Raudssus & DuckDuckGo, Inc..

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

