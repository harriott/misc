#!/bin/bash

# $misc/GRs/DCGRs-ud1-fixes.ps1
#  passed in  $misc/GRs/DCGRs.ps1  as argument to  $misc/GRs/update-depth1.ps1

# Joseph Harriott  lun 21 avr 2025

# fix some awkward nodes : fickle tricky stuff left in other people's remotes

if ( $repository -match 'nonexistant' ) { return }
elseif ( $repository -match 'withastro-astro' )
  { sl packages\astro\test\fixtures\special-chars-in-component-imports\src\components
    mi and-rockets-🚀 and-rockets-_ }
cd $cGRs

