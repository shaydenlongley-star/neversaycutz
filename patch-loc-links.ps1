# Swap locations.html card links:
# - name -> Google Maps (external)
# - image -> branch page (internal)
$file = "C:\Claude Code\neversaycutz\locations.html"
$utf8 = [System.Text.Encoding]::UTF8
$html = [System.IO.File]::ReadAllText($file, $utf8)

# slug -> [mapsUrl, imgFile]
$branches = [ordered]@{
  "thonglor"                  = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Thonglor+Sukhumvit+55+Bangkok", "thonglor.jpg")
  "sukhumvit-20"              = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+20+Bangkok", "sukhumvit-20.jpg")
  "sukhumvit-51"              = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+51+Thong+Lo+Bangkok", "sukhumvit-51.jpg")
  "onnut"                     = @("https://www.google.com/maps/search/NEVERSAYCUTZ+On+Nut+Century+Movie+Plaza+Bangkok", "onnut.png")
  "ari"                       = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Ari+Bangkok", "ari.jpg")
  "siam-square-one"           = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Siam+Square+One+Bangkok", "siam-square-one.jpg")
  "silom"                     = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Silom+Liberty+Square+Bangkok", "silom.jpg")
  "town-in-town"              = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Town+In+Town+Lat+Phrao+Bangkok", "town%20in%20town.jpg")
  "ratchayothin"              = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Avenue+Ratchayothin+Bangkok", "ratchayothin.jpg")
  "central-world"             = @("https://www.google.com/maps/search/NEVERSAYCUTZ+CentralWorld+Bangkok", "central%20world.jpg")
  "mbk"                       = @("https://www.google.com/maps/search/NEVERSAYCUTZ+MBK+Center+Bangkok", "mbk.jpg")
  "victoria-gardens-bang-kae" = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Victoria+Gardens+Bang+Khae+Bangkok", "Victoria%20Gardens.jpg")
  "central-pinklao"           = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Central+Pinklao+Bangkok", "Central%20Pinklao.jpg")
  "don-muang"                 = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Don+Muang+Happy+Avenue+Bangkok", "Don%20Muang.jpg")
  "the-circle-ratchapruk"     = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Circle+Ratchapruk+Bangkok", "The%20Circle%20Ratchapruk.png")
  "the-mall-ngamwongwan"      = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Ngamwongwan+Nonthaburi", "The%20mall%20Ngamwongwan.jpg")
  "little-walk-bangna"        = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Little+Walk+Bang+Na+Bangkok", "Little%20Walk%20Bangna.jpg")
  "lasalle"                   = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Lasalle+Avenue+Bangkok", "Lasalle.jpg")
  "the-crystal-park"          = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Crystal+Park+Ram+Intra+Bangkok", "The%20Crystal%20Park.jpg")
  "101-true-digital-park"     = @("https://www.google.com/maps/search/NEVERSAYCUTZ+101+True+Digital+Park+Bangkok", "101%20True%20Digital%20Park.jpg")
  "the-nine-rama-9"           = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Nine+Center+Rama+9+Bangkok", "The%20Nine%20Center%20Rama%209.jpg")
  "the-mall-bangkapi"         = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bangkapi+Bangkok", "The%20Mall%20Bangkapi.png")
  "the-mall-bangkhae"         = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bang+Khae+Bangkok", "The%20Mall%20Bangkae.jpg")
  "covehill"                  = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Cove+Hill+Charoen+Krung+Bangkok", "cove-hill.jpg")
  "the-mall-thapra"           = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Thapra+Bangkok", "the-mall-thapra.png")
  "muang-thong"               = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Muang+Thong+Thani+Chaengwattana+Nonthaburi", "Muang%20Thong.png")
  "korat"                     = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Terminal+21+Korat+Nakhon+Ratchasima", "Korat.jpg")
  "the-bright-rama-ii"        = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Bright+Rama+2+Bangkok", "The%20Bright%20Rama%20II.jpg")
  "ptt-prachauthit"           = @("https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Pracha+Uthit+Lat+Phrao+Bangkok", "PTT%20Prachauthit-Ladprao.jpg")
  "ptt-vibhavadi"             = @("https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Vibhavadi+Rangsit+Bangkok", "PTT%20Vibhavadi-Rangsit%2062.jpg")
  "ptt-boromratchachonnani"   = @("https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Boromratchachonnani+97+Bangkok", "PTT%20Boromratchachonnani%2097.jpg")
  "market-place-nawamin"      = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Market+Place+Nawamin+Bangkok", "Market%20Place%20Nawamin.jpg")
  "charn-at-the-avenue"       = @("https://www.google.com/maps/search/NEVERSAYCUTZ+Charn+At+The+Avenue+Chaengwattana+Bangkok", "Charn%20At%20The%20Avenue.png")
  "the-quarter-silom"         = @("https://www.google.com/maps/search/NEVERSAYCUTZ+The+Quarter+Silom+Bangkok", "quarter-silom.jpg")
}

foreach ($slug in $branches.Keys) {
    $mapsUrl = $branches[$slug][0]
    $imgFile = $branches[$slug][1]

    # 1. Swap name link href to Maps
    $html = $html.Replace(
        "href=`"branches/$slug.html`" class=`"loc-name-link`"",
        "href=`"$mapsUrl`" target=`"_blank`" rel=`"noopener`" class=`"loc-name-link`""
    )

    # 2. Wrap loc-card-img div with link to branch page
    $imgPattern = '(<div class="loc-card-img"><img src="img/branches/' + [regex]::Escape($imgFile) + '"[^>]+></div>)'
    $html = [regex]::Replace($html, $imgPattern, '<a href="branches/' + $slug + '.html" class="loc-card-img-link">$1</a>')

    Write-Host "Patched: $slug"
}

[System.IO.File]::WriteAllText($file, $html, $utf8)
Write-Host "`nDone."
