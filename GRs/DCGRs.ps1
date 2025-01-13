
# Joseph Harriott - lun 11 nov 2024

# cd $DCGRs; & $misc/GRs/DCGRs.ps1

# #=> 1 create  DCGRs.clones
# . $misc/GRs/getClonesList.ps1

#=> 2 update D:\CITGRs
robocopy /mir $DCGRs D:\CITGRs  # because I might've made changes from another machine

#=> 3 remove
# some repositories that don't update easily

#=> 4 git clone
$clones = gc $misc/GRs/DCGRs.clones
foreach ($clone in $clones) {
  $rrp = $clone -replace ' .*', ''  # repository relative path
  if ( ! ( test-path "$DCGRs\$rrp" ) ) {
    "$DCGRs\$rrp not there"
    $url = $clone -replace '.* ', ''  # repository url
    git clone --depth 1 $url D:\CITGRs\$rrp
  }
} # fd -td <part_of_path>

# #=> 5 update  D:\CITGRs
# . $misc\GRs\update-depth1.ps1

#=> 6 symlinks in  D:\CITGRs
# because Dropbox doesn't like symlinks...
ls -force -s | ?{$_.linktype}

#=> 7 sync to  $DCGRs
read-host "going to  Robocopy  from  D:\CITGRs  to  $DCGRs"
robocopy /mir D:\CITGRs $DCGRs

