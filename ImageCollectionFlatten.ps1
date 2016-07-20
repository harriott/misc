# vim: set tw=0: http://momentary.eu/

# Joseph Harriott - Wed 20 Jul 2016
# Recursively find all *.jpg, *.jpeg & *.png files in subfolders in the current directory,
# copy them into the current directory with prefixes representing their relative filepaths.
# -----------------------------------------------------------------------------------------

gci -r -i *.jpg, *.jpeg, *.png |
foreach{
	$md=Resolve-Path $_.fullname -Relative
	$md
	}

