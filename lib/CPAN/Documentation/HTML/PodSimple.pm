package CPAN::Documentation::HTML::PodSimple;
BEGIN {
  $CPAN::Documentation::HTML::PodSimple::AUTHORITY = 'cpan:GETTY';
}
{
  $CPAN::Documentation::HTML::PodSimple::VERSION = '0.001';
}

use Moo;
extends 'Pod::Simple::XHTML';

# sub html_header_before_title { '' }
# sub html_header_after_title { '' }
# sub html_footer { '' }

# sub do_beginning { 1 }

1;
__END__
=pod

=head1 NAME

CPAN::Documentation::HTML::PodSimple

=head1 VERSION

version 0.001

=head1 AUTHOR

Torsten Raudssus <torsten@raudss.us>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Torsten Raudssus.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

