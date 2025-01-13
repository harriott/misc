
# vim: set fdl=2:

# cd $DCGRs; & $misc/GRs/getClonesList.ps1
# also sourced from  $misc/GRs/DCGRs.ps1

$list = "$misc/GRs/DCGRs.clones"
if ( test-path $list ) { ri $list }
$repos = @()
fd -utd '\.git$' | %{
  $repo = $_.substring(0, $_.length -6) # repository relative path
  $repo = $repo.replace('\','/')
  $rgurl = rg 'url = ' $_\config
  $url = $rgurl.substring(7)
  $repos += "$repo $url"
}
$repos | sort >> $list
$list

