# vim: set et tw=0:

# a quick script to grab  CPAN list of installed modules as  cpanList  vim filetype
# Joseph HARRIOTT - Sat 29 Jan 2022


# get the CPAN list of installed modules
$cpanListArray = cpan -l

# sort
$cpanListArraySorted = $cpanListArray | sort

# split the array into more manageable chunks that also respect vim's default  synmaxcol
$cpanListArraySortedChunked = Get-Chunk 30 -InputObject $cpanListArraySorted

# prepare a  cpanList  filetype  (see $onGH/vimfiles/syntax/cpanList.vim)
$mcpanL = "$machine\troin\cpanList.txt"
'vim: ft=cpanList:' > $mcpanL
'' >> $mcpanL
$modules = $cpanListArray.length
"$modules modules:" >> $mcpanL

# send the list
$ofs = '   '  # will allow good separation of elements
foreach ($manageable in $cpanListArraySortedChunked) {
  # convert array list to well-separated string list
  $manageableStillWithTabs = [string]$manageable
  # convert tabs to "v" for version
  $cpanList = $manageableStillWithTabs.Replace("`t", ' v ')
  # fix the start of each line
  $cpanListReady = $ofs+$cpanList
  # send to file
  $cpanListReady >> $mcpanL
}

