$file = "C:\Claude Code\neversaycutz\locations.html"
$html = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

$replacements = @(
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Thonglor" target="_blank" rel="noopener"'; new = 'href="branches/thonglor.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+20" target="_blank" rel="noopener"'; new = 'href="branches/sukhumvit-20.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+51" target="_blank" rel="noopener"'; new = 'href="branches/sukhumvit-51.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+On+Nut" target="_blank" rel="noopener"'; new = 'href="branches/onnut.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Ari" target="_blank" rel="noopener"'; new = 'href="branches/ari.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Siam+Square+One" target="_blank" rel="noopener"'; new = 'href="branches/siam-square-one.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Silom" target="_blank" rel="noopener"'; new = 'href="branches/silom.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Town+in+Town" target="_blank" rel="noopener"'; new = 'href="branches/town-in-town.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Ratchayothin" target="_blank" rel="noopener"'; new = 'href="branches/ratchayothin.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Central+World" target="_blank" rel="noopener"'; new = 'href="branches/central-world.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+MBK+Center" target="_blank" rel="noopener"'; new = 'href="branches/mbk.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Victoria+Gardens+Bang+Kae" target="_blank" rel="noopener"'; new = 'href="branches/victoria-gardens-bang-kae.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Central+Pinklao" target="_blank" rel="noopener"'; new = 'href="branches/central-pinklao.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Don+Muang" target="_blank" rel="noopener"'; new = 'href="branches/don-muang.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Circle+Ratchapruk" target="_blank" rel="noopener"'; new = 'href="branches/the-circle-ratchapruk.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Ngamwongwan" target="_blank" rel="noopener"'; new = 'href="branches/the-mall-ngamwongwan.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Little+Walk+Bang+Na" target="_blank" rel="noopener"'; new = 'href="branches/little-walk-bangna.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Laselle" target="_blank" rel="noopener"'; new = 'href="branches/lasalle.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Crystal+Park+Ram+Intra" target="_blank" rel="noopener"'; new = 'href="branches/the-crystal-park.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+101+True+Digital+Park" target="_blank" rel="noopener"'; new = 'href="branches/101-true-digital-park.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Nine+Rama+9" target="_blank" rel="noopener"'; new = 'href="branches/the-nine-rama-9.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bangkapi" target="_blank" rel="noopener"'; new = 'href="branches/the-mall-bangkapi.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bang+Khae" target="_blank" rel="noopener"'; new = 'href="branches/the-mall-bangkhae.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Covehill" target="_blank" rel="noopener"'; new = 'href="branches/covehill.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Tha+Phra" target="_blank" rel="noopener"'; new = 'href="branches/the-mall-thapra.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Muang+Thong" target="_blank" rel="noopener"'; new = 'href="branches/muang-thong.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Korat" target="_blank" rel="noopener"'; new = 'href="branches/korat.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Bright+Rama+II" target="_blank" rel="noopener"'; new = 'href="branches/the-bright-rama-ii.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Prachauthit" target="_blank" rel="noopener"'; new = 'href="branches/ptt-prachauthit.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Vibhavadi" target="_blank" rel="noopener"'; new = 'href="branches/ptt-vibhavadi.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Boromratchachonnani" target="_blank" rel="noopener"'; new = 'href="branches/ptt-boromratchachonnani.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Market+Place+Nawamin" target="_blank" rel="noopener"'; new = 'href="branches/market-place-nawamin.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Charn+at+The+Avenue" target="_blank" rel="noopener"'; new = 'href="branches/charn-at-the-avenue.html"' },
    @{ old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+The+Quarter+Silom" target="_blank" rel="noopener"'; new = 'href="branches/the-quarter-silom.html"' }
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
