# Alien::Build::Plugin::Cleanse::BuildDir [![Build Status](https://secure.travis-ci.org/plicease/Alien-Build-Plugin-Cleanse-BuildDir.png)](http://travis-ci.org/plicease/Alien-Build-Plugin-Cleanse-BuildDir)

Alien::Build plugin to cleanse the build dir

# SYNOPSIS

\#  need to enter something here

    1;

# DESCRIPTION

This plugin deletes the build directory after the make phase.
This is useful if you have a large build size, and was
developed because [Alien::gdal](https://metacpan.org/pod/Alien::gdal) is enormous, and was
filling up disk space on cpan testers.  

You might want to use it conditionally, for example when you know the
build dir contents are not needed later.

# NAME

Alien::Build::Plugin::Cleanse::BuildDir - Alien::Build plugin to cleanse the build dir

# VERSION

version 0.01

# SEE ALSO

- [Alien::Build](https://metacpan.org/pod/Alien::Build)

# AUTHOR

Shawn Laffan <shawnlaffan@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Shawn Laffan.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# AUTHOR

Shawn Laffan <shawnlaffan@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2018 by Shawn Laffan.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
