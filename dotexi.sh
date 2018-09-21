#!/bin/sh
# Copyright (C) 2018  David Arroyo Menéndez

# Author: David Arroyo Menéndez <davidam@gnu.org>
# Maintainer: David Arroyo Menéndez <davidam@gnu.org>

# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.

# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301 USA,

po4a-translate -f texinfo -m orgguide.texi -p orgguide.es.po -l orgguide.es.texi
LIN_INI=`grep -n '@settitle' orgguide.es.texi | cut -d: -f1`
LIN_FIN=`grep -n '@finalout' orgguide.es.texi | cut -d: -f1`
LIN_TOT=`wc -l orgguide.es.texi | cut -d' ' -f1`
head -${LIN_INI} orgguide.es.texi > orgguide.es.tmp1
head -`echo "${LIN_FIN} - 1" | bc` orgguide.es.texi | tail -n`echo "${LIN_FIN} - ${LIN_INI} - 1" | bc`> orgguide.es.tmp2
echo "@documentencoding UTF-8" > orgguide.es.tmp3
echo "@documentlanguage es"  >> orgguide.es.tmp3
echo "@smallbook" > orgguide.es.tmp4
tail -n`echo "${LIN_TOT} - ${LIN_FIN} + 1" | bc` orgguide.es.texi > orgguide.es.tmp5
cat orgguide.es.tmp1 > orgguide.es.texi
cat orgguide.es.tmp2 >> orgguide.es.texi
cat orgguide.es.tmp3 >> orgguide.es.texi
cat orgguide.es.tmp4 >> orgguide.es.texi
cat orgguide.es.tmp5 >> orgguide.es.texi
