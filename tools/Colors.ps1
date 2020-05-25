# vim: set fdl=2 tw=0:

# Joseph Harriott - http://momentary.eu/ - Mon 17 Feb 2020

# This is done also by Bonny Lindberg at  http://stackoverflow.com/questions/20541456/list-of-all-colors-available-for-powershell

# Write to Console all of the colour combinations.
# PS> E:\Files\IT_stack\Colors.ps1
# --------------------------------------------------------

$AllColors = @("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")
foreach ($backColor in $AllColors) {
  "$backColor background:"
  foreach ($foreColor in $AllColors) {
    Write-Host "$foreColor " -background $backColor -foreground $foreColor -nonewline
  }
  ""
}
