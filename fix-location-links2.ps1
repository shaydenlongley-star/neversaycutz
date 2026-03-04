$file = "C:\Claude Code\neversaycutz\locations.html"
$html = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$replacements = @(
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Thapra" target="_blank" rel="noopener"'; new = 'href="branches/the-mall-thapra.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Korat+Nakhon+Ratchasima" target="_blank" rel="noopener"'; new = 'href="branches/korat.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Prachauthit+Ladprao" target="_blank" rel="noopener"'; new = 'href="branches/ptt-prachauthit.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Vibhavadi+Rangsit+62" target="_blank" rel="noopener"'; new = 'href="branches/ptt-vibhavadi.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Boromratchachonnani+97" target="_blank" rel="noopener"'; new = 'href="branches/ptt-boromratchachonnani.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Charn+At+The+Avenue" target="_blank" rel="noopener"'; new = 'href="branches/charn-at-the-avenue.html"' }
)

foreach ($r in $replacements) {
    if ($html.Contains($r.old)) {
        $html = $html.Replace($r.old, $r.new)
        Write-Host "Replaced: $($r.new)"
    } else {
        Write-Host "NOT FOUND: $($r.old)"
    }
}

[System.IO.File]::WriteAllText($file, $html, [System.Text.Encoding]::UTF8)
Write-Host "Done."
