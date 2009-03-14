#!/bin/sh

# Copyright 2009 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

OLDEXT="txt"
NEWEXT="html"
API_TEMPLATE_DIR="api/templates"
ls doc/*.txt | 
while read F
do
  BASE=`basename $F`
  NEWFILE="${BASE/%${OLDEXT}/${NEWEXT}}"
  echo -n "Converting ${BASE} via reST..."
  python bin/rst2html.py --template=doc/template.rst2html --no-doc-title "${F}" > "${API_TEMPLATE_DIR}/built_${NEWFILE}"
  echo " done."
done
