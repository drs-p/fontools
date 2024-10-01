FONTOOLS
========

This package provides tools to simplify the use of OpenType fonts with pdftex.

By far the most important program in this bundle is autoinst:

 *  **autoinst**

    a wrapper script around Eddie Kohler's LCDF TypeTools.
    Autoinst aims to automate the installation of OpenType fonts in LaTeX
    by calling the LCDF TypeTools (with the correct options) for all fonts
    you wish to install, and generating the necessary .fd and .sty files.

In addition, this bundle contains a few other, less important utilities:

*   **afm2afm**

    re-encode .afm files

*   **ot2kpx**

    extract kerning pairs from OpenType fonts

*   **splitttc**

    split an OpenType Collection file (ttc or otc) into individual fonts


Prerequisites
-------------

### Perl

The Fontools are written in Perl; any remotely recent version should work.
Perl is usually installed on Linux and Unix systems;
for Windows, try [ActivePerl](http://www.activestate.com)
or [Strawberry Perl](http://strawberryperl.com).

### LCDF TypeTools and T1Utils

Of course, Autoinst needs the LCDF TypeTools and T1Utils
(available from <www.lcdf.org/type>, and also on [CTAN](https://ctan.org/pkg/lcdf-typetools)
and as part of TeXLive);
these should be installed in a directory on your PATH.

### Kpathsea

Automatically installing the fonts into a suitable TEXMF tree
(as Autoinst does by default) requires a TeX-installation that uses
the kpathsea library; with TeX distributions that implement their
own directory searching (such as MiKTeX), Autoinst will complain that
it cannot find the kpsewhich program and install all generated files
into subdirectories of the current directory.

If you use such a TeX distribution, either move these files to their
destinations by hand, or use the -target command line option
(please see the manual for more information).


Installation
------------

When installing manually, the encoding files in the `share` directory
should be moved to a "standard" location where otftotfm can find them.
What this location is depends on your TeX installation;
in TeXLive, it should be `$TEXMFLOCAL/fonts/enc/dvips/fontools` or,
if you don't have write permissions in `$TEXMFLOCAL`,
`$TEXMFHOME/fonts/enc/dvips/fontools`.

The scripts in the `bin` directory should be placed in a directory
on your PATH (or else you have to call them with their full path name).

Of course, when using a package manager (such as tlmgr) to do
the installation, all files will automatically be put in the right
location.


LICENSE & COPYRIGHT
-------------------

This software is copyright (C) 2005-__YEAR__ Marc Penninga.
It is released under the terms of the GNU General Public Licence;
see the file LICENSE for the license conditions.


DISCLAIMER
----------

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.
