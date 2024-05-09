
# vim: set fdl=2:

# Joseph Harriott - lun. 04 mars 2024

# Recursively find all *.git directories in  $DCGRs
# for each one, execute a git pull, then copy over to  $DCGRs  on Dropbox.
# -------------------------------------------------------------------------
# $DCGRs  should be defined in  $MSWin10\PSProfile.ps1
# $cITh  &  $DCGRs  are defined in  $MSWin10\PSProfile.ps1
# PS> iex "$misc/GHreposPulls.ps1"

# git clone https://github.com/bbatsov/prelude $DCGRs/emacs/emacsbbatsov-prelude
# git clone https://github.com/GChristensen/rho-emacs $DCGRs/emacs/GChristensen-rho-emacs
# git clone https://github.com/magnars/.emacs.d $DCGRs/emacs/magnars-_emacs.d
# git clone https://github.com/MatthewZMD/.emacs.d $DCGRs/emacs/MatthewZMD-_emacs_d
# git clone https://github.com/nashamri/spacemacs-theme $DCGRs/emacs/nashamri-spacemacs-theme
# git clone https://github.com/monkeyjunglejuice/emacs.onboard $DCGRs/emacs/monkeyjunglejuice-emacs_onboard

sl $DCGRs; write-host $pwd
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
  sl $repository; git pull; sl $DCGRs
}
write-host ''
Read-Host '- now going to RobCopy to $DCGRs, when you''re ready'
$LogFile = $ITscr+"\GHreposRoboCopy.log"
'vim: nowrap tw=0:' > $LogFile
'' >> $LogFile
iex "robocopy /mir $DCGRs $DCGRs /NP /unilog+:$LogFile /tee"
gvim -c 'set columns=217 lines=54' $LogFile


