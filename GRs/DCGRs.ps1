
# Joseph Harriott - ven 13 sept 2024

# & $misc/GRs/DCGRs.ps1

# robocopy /mir $DCGRs D:\CITGRs

#=> 0 clones
function gcd1 { git clone --depth 1 $args[0] $args[1] }
# git clone --depth 1 https://github.com/simmel/urxvt-resize-font D:\CITGRs\urxvtFontSize/simmel-urxvt-resize-font

#==> clone
$clones = gc $misc/GRs/all.clones
foreach ($clone in $clones) {
  $rrp = $clone -replace ' .*', ''  # repository relative path
  if ( ! ( test-path "$DCGRs\$rrp" ) ) {
    "$DCGRs\$rrp not there"
    $url = $clone -replace '.* ', ''  # repository url
    git clone --depth 1 $url D:\CITGRs\$rrp
  }
} # fd -td <part_of_path>

# #=> 1 updates  D:\CITGRs
# . $misc\GRs\update-depth1.ps1

# #=> 2 symlinks in  D:\CITGRs
# # because Dropbox doesn't like symlinks...
# ls -force -s | ?{$_.linktype}

# #=> 3 sync to  $DCGRs
# read-host "going to  Robocopy  from  D:\CITGRs  to  $DCGRs"
# robocopy /mir D:\CITGRs $DCGRs

