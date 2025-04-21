
# vim: set fdl=2:

# Joseph Harriott - Mon 21 Oct 2024

# depth=1 update a load of cloned  Git  repositories from their remotes

# & $misc/GRs/update-depth1.ps1
#  sourced from
#   $vfv/packs/get-win64/updates.ps1
#   $misc/GRs/DCGRs.ps1
# clone repositories destined for  $CITGRs ($AjB/export-jo) to $Drpbx\JH\dev-Sh\HPEB840G37

# Test for  $vfv/packs:
#  robocopy /mir $vfv/packs                            $home\Play0\packs
#  robocopy /mir $vfv/packs\packs-cp\opt\nerdcommenter $home\Play0\nerdcommenter
#  robocopy /mir $vfv/packs\packs-cp\opt\nerdtree      $home\Play0\nerdtree
#  robocopy /mir $vfv/plugin\fzf                       $home\Play0\fzf

if ( !$rd ) { $rd = [string]$pwd } # root directory
$rd
if ( !$sf ) { $update = 'GO' } # start from
$repositories = @()
$a0 = $args[0]
fd -utd '^\.git$' | %{
  $rrp = $_.substring(0, $_.length -6) # repository relative path
  $repository = "$(split-path (split-path $_) -leaf)"
  $repositories += $repository
  if ( $repository -eq $sf ) { $update = 'GO' }
  if ( $update -eq 'GO' ) {
    "fetch $repository" | Out-HostColored $repository
      cd "$rd\$rrp"
      [array]$fetched = (git fetch --depth 1 -v 2>&1)
      $fetched[-1]
      if ( ! ( $fetched[-1] -match '=' ) ) {
        $gbsc=$(git branch --show-current)
        if ( $gbsc ) {
          "reset $repository" | Out-HostColored $repository
          [string]$reset=$(git reset --hard "$(git remote show)/$gbsc" 2>&1)
          # $reset=$(git reset --hard bogus/fatal 2>&1)
          if ( $reset.substring(0,5) -eq 'fatal' ) { exit }
        } else { "no branch $(git rev-parse --short HEAD)" }
        "clean $repository" | Out-HostColored $repository
        git clean -dfx
      }
  }
  if ($a0) { . $a0 } # possible fixes
}
cd $rd
$repositories > repos

