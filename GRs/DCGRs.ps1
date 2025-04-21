
# Joseph Harriott - lun 11 nov 2024

# & $misc/GRs/DCGRs.ps1

#=> 0 last_update check
gc "$DCGRs/last_update"
Read-Host "- good to continue? "

# #=> 1 optionally update D:\CITGRs
# read-host "going to  Robocopy  from  $DCGRs  to  D:\CITGRs"
# robocopy /mir $DCGRs D:\CITGRs  # because I might've made changes from another machine

#=> 2 last_update append
(get-date).tostring('yyMMdd-HHmmss')+" $Cn" >> D:/CITGRs/last_update

# #=> 3 (re)create  DCGRs.clones
# sl $DCGRs
# 'updating  $misc/GRs/DCGRs.clones'
# . $misc/GRs/getClonesList.ps1 $misc/GRs/DCGRs.clones

#=> 4 remove tricky clones
# some repositories that don't update easily

#=> 5 git clone
''
'getting any new clones'
$clones = gc $misc/GRs/DCGRs.clones
foreach ($clone in $clones) {
  $rrp = $clone -replace ' .*', ''  # repository relative path
  if ( ! ( test-path "$DCGRs\$rrp" ) ) {
    "$DCGRs\$rrp not there"
    $url = $clone -replace '.* ', ''  # repository url
    git clone --depth 1 $url D:\CITGRs\$rrp
  }
} # fd -td <part_of_path>

# #=> 6 update  D:\CITGRs
# sl D:\CITGRs; . $misc\GRs\update-depth1.ps1 $misc/GRs/DCGRs-ud1-fixes.ps1

#=> 7 symlinks in  D:\CITGRs
''
'symlinks'
# because Dropbox doesn't like symlinks...
sl D:\CITGRs; ls -force -s | ?{$_.linktype}

#=> 8 sync to  $DCGRs
read-host "going to  Robocopy  from  D:\CITGRs  to  $DCGRs"
robocopy /mir D:\CITGRs $DCGRs

