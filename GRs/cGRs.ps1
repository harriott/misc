
# Joseph Harriott - ven 22 août 2025

# & $misc/GRs/cGRs.ps1

#=> 0 last_update check
gc "$misc/GRs/cGRs-lu"
Read-Host "- good to continue? "

# #=> 1 optionally update  $GRs
# # because I might've made changes from another machine
# 'tweak & run $misc/ITr/Robocopy.ps1'; return

#=> 2 last_update append
(get-date).tostring('yyMMdd-HHmmss')+" $Cn" >> "$misc/GRs/cGRs-lu"

# #=> 3 (re)create  cGRs.clones
# 'updating  $misc/GRs/cGRs.clones'
# sl $GRs; . $misc/GRs/getClonesList.ps1 $misc/GRs/cGRs.clones

#=> 4 remove tricky clones
# some repositories that don't update easily

#=> 5 git clone
''; 'getting any new clones'
$clones = gc $misc/GRs/cGRs.clones
foreach ($clone in $clones) {
  $rrp = $clone -replace ' .*', ''  # repository relative path
  if ( ! ( test-path "$GRs\$rrp" ) ) {
    "$GRs\$rrp not there"
    $url = $clone -replace '.* ', ''  # repository url
    git clone --depth 1 $url $GRs\$rrp
  }
} # fd -td <part_of_path>

# #=> 6 update  $GRs
# ''; 'update depth=1 all clones'
# sl $GRs; . $misc\GRs\update-depth1.ps1 $misc/GRs/cGRs-ud1-fixes.ps1

# #=> 7 symlinks in  $GRs
# ''; 'symlinks'
# # because Dropbox doesn't like symlinks...
# sl $GRs; ls -force -s | ?{$_.linktype}

#=> 8 sync to  $GRs
'now tweak & run $misc/ITr/Robocopy.ps1'

