# vim: set tw=0:

# Joseph Harriott - http://momentary.eu/ - Tue 10 May 2016

# This is done also by Bonny Lindberg at  http://stackoverflow.com/questions/20541456/list-of-all-colors-available-for-powershell

# Write to Console all of the colour combinations.
# PS> E:\Files\IT_stack\Colors.ps1
# --------------------------------------------------------

$AllColors = @("Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White")
foreach ($foreColor in $AllColors) {
  foreach ($backColor in $AllColors) {
    Write-Host "$foreColor on $backColor " -background $backColor -foreground $foreColor -nonewline
  }
}
