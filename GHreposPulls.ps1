
# vim: set fdl=2:

# Joseph Harriott - Sun 04 Sep 2022

# Recursively find all *.git directories in  $GHrCl
# for each one, execute a git pull, then copy over to  $GHrUse  on Dropbox.
# -------------------------------------------------------------------------
# $GHrCl  is defined in  $machine\PSProfile.ps1
# $cITh  &  $GHrUse  are defined in  $MSWin10\PSProfile.ps1
# PS> iex "$onGH/misc/GHreposPulls.ps1"

# git clone https://github.com/bbatsov/prelude $GHrCl/emacs/emacsbbatsov-prelude
# git clone https://github.com/GChristensen/rho-emacs $GHrCl/emacs/GChristensen-rho-emacs
# git clone https://github.com/magnars/.emacs.d $GHrCl/emacs/magnars-_emacs.d
# git clone https://github.com/MatthewZMD/.emacs.d $GHrCl/emacs/MatthewZMD-_emacs_d
# git clone https://github.com/nashamri/spacemacs-theme $GHrCl/emacs/nashamri-spacemacs-theme
# git clone https://github.com/monkeyjunglejuice/emacs.onboard $GHrCl/emacs/monkeyjunglejuice-emacs_onboard

sl $GHrCl; write-host $pwd
gci -Directory -r *.git | select -expand FullName |
%{
  $null = takeown /f $_
  $repository=$_.Replace('\.git', '')
  $null = takeown /f $repository
  Write-Host 'pulling ' -NoNewline
  [System.Console]::BackgroundColor = 'DarkCyan'
  [System.Console]::ForegroundColor = 'White'
  Write-Host $repository -NoNewline
  [System.Console]::ResetColor(); ''
  sl $repository; git pull; sl $GHrCl
}
write-host ''
Read-Host '- now going to RobCopy to $GHrUse, when you''re ready'
$LogFile = $cITh+"\GHreposRoboCopy.log"
'vim: nowrap tw=0:' > $LogFile
'' >> $LogFile
iex "robocopy /mir $GHrCl $GHrUse /NP /unilog+:$LogFile /tee"
gvim -c 'set columns=217 lines=54' $LogFile


