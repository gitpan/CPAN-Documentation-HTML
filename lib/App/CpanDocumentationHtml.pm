package App::CpanDocumentationHtml;
BEGIN {
  $App::CpanDocumentationHtml::AUTHORITY = 'cpan:GETTY';
}
{
  $App::CpanDocumentationHtml::VERSION = '0.002';
}
# ABSTRACT: Application class

use MooX Options => [ flavour => [qw( pass_through )], protect_argv => 0 ];
use CPAN::Documentation::HTML;
use Cwd;
use Path::Class;
use namespace::autoclean;

option root => (
	is => 'ro',
	predicate => 1,
	format => 's',
);

option dist => (
	is => 'ro',
	predicate => 1,
	format => 's',
);

option url_prefix => (
	is => 'ro',
	predicate => 1,
	format => 's',
);

option index => (
	is => 'ro',
);

option template => (
	is => 'ro',
	predicate => 1,
	format => 's',
);

option asset => (
	is => 'ro',
	format => 's%',
	predicate => 1,
);

option bin => (
	is => 'ro',
	format => 's@',
	predicate => 1,
);

option lib => (
	is => 'ro',
	format => 's@',
	predicate => 1,
);

option file => (
	is => 'ro',
	format => 's@',
	predicate => 1,
);

option dir => (
	is => 'ro',
	format => 's@',
	predicate => 1,
);

option default_bins => (
	is => 'ro',
	format => 's@',
	builder => sub {[qw(
		bin
		script
	)]},
);

option default_libs => (
	is => 'ro',
	format => 's@',
	builder => sub {[qw(
		lib
	)]},
);

sub run {
	my ( $self ) = @_;
	my $cd = CPAN::Documentation::HTML->new(
		$self->has_root ? ( root => $self->root ) : (),
		$self->has_url_prefix ? ( url_prefix => $self->url_prefix ) : (),
		$self->has_template ? ( template => (scalar file($self->template)->slurp) ) : (),
		$self->has_asset ? ( assets => $self->asset ) : (),
	);
	if ($self->has_file) {
		for (@{$self->file}) {
			$cd->add_dist(file($_)->absolute->stringify);
		}
	}
	my $dist = $self->has_dist ? $self->dist : "imported_by_".file($0)->basename;
	if ($self->has_lib) {
		for (@{$self->lib}) {
			$cd->add_lib($dist,$_);
		}
	}
	if ($self->has_bin) {
		for (@{$self->bin}) {
			$cd->add_bin($dist,$_);
		}
	}
	if (@ARGV) {
		for (@ARGV) {
			if (-d $_) {
				my $dir = dir($_);
				for (@{$self->default_libs}) {
					my $lib_dir = dir($dir,$_);
					$cd->add_lib($dist,$lib_dir) if -d $lib_dir;
				}
				for (@{$self->default_bins}) {
					my $bin_dir = dir($dir,$_);
					$cd->add_bin($dist,$bin_dir) if -d $bin_dir;
				}
			} elsif (-f $_) {
				$cd->add_dist(file($_)->absolute->stringify);
			} else {
				die __PACKAGE__.": no idea what todo with '".$_."'";
			}
		}
	}
	$cd->save_cache;
	$cd->save_index;
	exit 0;
}

1;


__END__
=pod

=head1 NAME

App::CpanDocumentationHtml - Application class

=head1 VERSION

version 0.002

=head1 DESCRIPTION

See L<cpan_documentation_html>.

=head1 SUPPORT

IRC

  Join #duckduckgo on irc.freenode.net. Highlight Getty for fast reaction :).

Repository

  http://github.com/Getty/p5-cpan-documentation-html
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/Getty/p5-cpan-documentation-html/issues

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

