
# vim: set fdl=2:

# . $misc/GRs/getClonesList.ps1 $misc/GRs/test.clones
#  sourced from
#   $misc/GRs/DCGRs.ps1
#   $vfv/getRepos/win64.ps1
#  fails if sourced from within a repository

$a0 = $args[0]
if ($a0) {
  if ( test-path $a0 ) { $repos = gc $a0; ri $a0 } else { $repos = @() }
  fd -utd '^\.git$' | %{
    $repo = $_.substring(0, $_.length -6) # repository relative path
    $repo = $repo.replace('\','/')
    $rgurl = rg 'url = ' $_\config
    $url = $rgurl.substring(7)
    $ru = "$repo $url" -replace '(\S* \S*) \S*$','$1' # remove any subsequent URLs (vim-markdown)
    $ru = "$ru" -replace 'git@github.com:','https://github.com/'
    $ru = "$ru" -replace '\.git$',''
    $repos += "$ru"
  }
  $repos | sort -Unique > $a0
  $a0
}

