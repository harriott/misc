
# vim: set fdl=2:

# Joseph Harriott - lun 13 mai 2024

# & $misc\GRs\getURLs.ps1
fd -utd '\.git$' | %{ rg 'url = ' $_\config } > GR_URLs.md
# :%s!\s\+url = !!|sort

