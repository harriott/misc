# vim: se fdl=1:

# Joseph Harriott - https://harriottgithubio/ - mar 12 août 2025

# $GRs, $ITr  defined in  $MSn\PS\Env.ps1

# & $misc/ITr/Robocopy.ps1

#=> 1 last_update check
gc "$misc/ITr/last_update"
Read-Host "- good to continue? "

#=> 2 $coreIT  Robocopy's to external drive

#=> 2 $GRs  Robocopy's
'getting  $GRs  file count'; (ls $cGRs -s).count
'getting  $ITr/GRs  file count'; (ls $ITr/GRs -s).count

#==> 0 to external drive
read-host "going to  Robocopy  from  $GRs  to  $ITr/GRs"
"GRs: "+(get-date).tostring('yyMMdd-HHmmss')+" $Cn -> $ITr/GRs" >> $misc/ITr/last_update
robocopy /mir $GRs $ITr/GRs

# #==> 1 from external drive
# read-host "going to  Robocopy  from  $ITr/GRs  to  $GRs"
# "GRs: "+(get-date).tostring('yyMMdd-HHmmss')+" $ITr/GRs -> $Cn" >> $misc/ITr/last_update
# robocopy /mir $ITr\GRs $GRs

#=> 2 $DJH/Cop-code  Robocopy's to external drive

#=> 2 $jtIT  Robocopy's to external drive

#=> 2 $jtIT-MSWinUser  Robocopy's to external drive

#=> 2 $tIs  Robocopy's to external drive

#=> 2 $ZN-rc  Robocopy's to external drive

