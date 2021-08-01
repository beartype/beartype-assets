#!/usr/bin/env sh
# -*- encoding: utf-8 -*-
# This script is licensed under the GLWTPL and offered with no warranty whatsoever. See
# https://github.com/me-shaon/GLWTPL/blob/master/LICENSE for details.

PROG_NAME="$( basename "${0}" )"
PROG_DIR="$( cd "$( dirname "${0}" )" && pwd )"
LOC="${1:-${PROG_DIR}/bear-ified.svg}"
BADGE_URL='https://img.shields.io/badge/%F0%9F%91%8C%F0%9F%90%BB-Bear--ified%E2%84%A2-dead80'

case "${#}" in
    1)
        LOC="${1}"
        ;;

    *)
        printf 1>&2 "Usage: ${PROG_NAME} LOC\n E.G.: ${PROG_NAME} ${LOC}\n"
        exit 1
        ;;
esac

_FETCH_PY="$( cat <<EOF
import sys, urllib.request
assert sys.version_info >= (3, 4)  # tested using 3.6, but this *should* work
req = urllib.request.Request(sys.argv[2])
req.add_header('User-Agent', 'Mozilla/5.0')
with urllib.request.urlopen(req) as f_in:
  with open(sys.argv[1], "w") as f_out:
    f_out.write(f_in.read().decode("utf-8"))
EOF
)"

# Of course curl is everywhere, right?
if type >/dev/null 2>&1 curl ; then
    exec curl >"${LOC}" "${BADGE_URL}"
# Hah! You thought we'd give up so easily? Not a chance! Surely wget is here.
elif type >/dev/null 2>&1 wget ; then
    exec wget --output-document "${LOC}" "${BADGE_URL}"
# Oh, so you want to play hardball, eh? Batteries included.
elif type >/dev/null 2>&1 "${PYTHON:-python3}" ; then
    exec "${PYTHON:-python3}" -c "${_FETCH_PY}" "${LOC}" "${BADGE_URL}"
# Goonies never say "die"!
elif type >/dev/null 2>&1 python ; then
    exec python -c "${_FETCH_PY}" "${LOC}" "${BADGE_URL}"
# You have bested us, gentleperson. Well played. Are you trying to run this on a router
# or a washing machine or something?
else
    printf 1>&2 "${PROG_NAME}: unable to find suitable fetcher\n${PROG_NAME} requires one of: curl, wget, python>=3.4\nset PYTHON environment variable to override python executable, if necessary\n"
    exit 1
fi
