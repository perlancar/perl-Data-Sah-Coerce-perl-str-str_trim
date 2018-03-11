package Data::Sah::Coerce::perl::str::str_trim;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 2,
        enable_by_default => 0,
        prio => 50,
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "!ref($dt)";
    $res->{expr_coerce} = join(
        "",
        "do { my \$res = $dt; \$res =~ s/\\A\\s+//s; \$res =~ s/\\s+\\z//s; \$res }",
    );

    $res;
}

1;
# ABSTRACT: Trim whitespaces at the beginning and end of string

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

The rule is not enabled by default. You can enable it in a schema using e.g.:

 ["str", "x.perl.coerce_rules"=>["str_trim"]]
