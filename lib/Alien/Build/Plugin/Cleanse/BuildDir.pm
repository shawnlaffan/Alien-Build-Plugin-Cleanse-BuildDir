package Alien::Build::Plugin::Cleanse::BuildDir;

use strict;
use warnings;
use 5.008001;
use Alien::Build;
use Alien::Build::Plugin;
use File::Path qw /remove_tree/;
use Cwd qw /getcwd/;

# ABSTRACT: Alien::Build plugin to cleanse the build dir
our $VERSION = '0.01';  # VERSION


sub init {
    my($self, $meta) = @_;

    $meta->after_hook ( build => sub {
        my($build) = @_;
        my $build_dir = $build->install_prop->{extract};
        
        if (!defined $build_dir) {
            $build->log ("Unable to determine build dir\n");
            return;
        }
        
        $build->log ("Going to delete $build_dir\n");
        $build->log ("Currently in " . getcwd() . "\n");
        #  clunky - not an OS sensitive check 
        if (getcwd() =~ /^$build_dir/) {
            chdir '..';
        }
        
        my $count = eval {
            remove_tree ($build_dir, {
                safe => 1,
                verbose => 1,
            });
        } || 0;
        $build->log ("Deleted $count items\n"); 
    });

}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Alien::Build::Plugin::Cleanse::BuildDir - Alien::Build plugin to cleanse the build dir

=head1 VERSION

version 0.01

=head1 SYNOPSIS

#  need to enter something here

 1;

=head1 DESCRIPTION

This plugin deletes the build directory after the make phase.
This is useful if you have a large build size, and was
developed because L<Alien::gdal> is enormous, and was
filling up disk space on cpan testers.  

You might want to use it conditionally, for example when you know the
build dir contents are not needed later.

=head1 SEE ALSO

=over 4

=item L<Alien::Build>

=back

=head1 AUTHOR

Shawn Laffan <shawnlaffan@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Shawn Laffan.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
