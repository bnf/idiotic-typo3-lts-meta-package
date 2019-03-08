#!/bin/sh

cat >composer.json <<EOF
{
    "name": "bnf/idiotic-typo3-lts-meta-package",
    "description": "Enfores LTS release of TYPO3 v8 (TESTPACKAGE, DO NOT USE IN PRODUCTION)",
    "type": "metapackage",
    "license": "MIT",
    "conflict": {
EOF

sed -n 's/.*"name": "\(typo3\/[^"]*\)",/\1/p' ../TYPO38.CMS/typo3/sysext/*/composer.json | \
	sed -e 's/.*/        "\0": ">=9",/' -e '$s/,$//' >> composer.json


echo "    }" >> composer.json
echo "}" >> composer.json
