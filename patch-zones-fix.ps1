# Fix: add data-zone + data-slug using regex (CRLF-safe)
$file = "C:\Claude Code\neversaycutz\locations.html"
$utf8 = [System.Text.Encoding]::UTF8
$html = [System.IO.File]::ReadAllText($file, $utf8)

$zones = [ordered]@{
    "thonglor"                  = "sukhumvit"
    "sukhumvit-20"              = "sukhumvit"
    "sukhumvit-51"              = "sukhumvit"
    "onnut"                     = "sukhumvit"
    "lasalle"                   = "sukhumvit"
    "little-walk-bangna"        = "sukhumvit"
    "101-true-digital-park"     = "sukhumvit"
    "siam-square-one"           = "city-centre"
    "central-world"             = "city-centre"
    "mbk"                       = "city-centre"
    "silom"                     = "city-centre"
    "the-quarter-silom"         = "city-centre"
    "ari"                       = "north"
    "town-in-town"              = "north"
    "ratchayothin"              = "north"
    "central-pinklao"           = "north"
    "the-mall-ngamwongwan"      = "north"
    "market-place-nawamin"      = "north"
    "don-muang"                 = "north"
    "the-crystal-park"          = "north"
    "muang-thong"               = "north"
    "charn-at-the-avenue"       = "north"
    "the-nine-rama-9"           = "north"
    "the-mall-bangkapi"         = "north"
    "ptt-prachauthit"           = "north"
    "ptt-vibhavadi"             = "north"
    "victoria-gardens-bang-kae" = "west"
    "the-circle-ratchapruk"     = "west"
    "the-mall-bangkhae"         = "west"
    "the-mall-thapra"           = "west"
    "covehill"                  = "west"
    "the-bright-rama-ii"        = "west"
    "ptt-boromratchachonnani"   = "west"
    "korat"                     = "province"
}

$count = 0
foreach ($slug in $zones.Keys) {
    $zone = $zones[$slug]

    # Match the opening card div (with or without --mobile) that already has data-slug from previous run,
    # OR without data-zone yet. We target by the img-link href to identify the card uniquely.
    # Pattern: opening card div (possibly already has data-zone from partial first run)
    # Strategy: find card div that contains href="branches/SLUG.html" class="loc-card-img-link"
    # and add data-zone + data-slug if not already present

    # Replace card divs that already have data-zone (from previous partial run) - skip if already set
    if ($html -match "data-slug=`"$slug`"") {
        Write-Host "Already set: $slug"
        continue
    }

    # Use regex to find the location-card div containing this slug's img-link
    # The pattern: <div class="location-card ..."> (no data-zone yet) followed by the slug link
    $pattern = '(<div class="location-card[^"]*")(>\s*<a href="branches/' + [regex]::Escape($slug) + '\.html" class="loc-card-img-link")'
    $replacement = "`$1 data-zone=`"$zone`" data-slug=`"$slug`"`$2"
    $newHtml = [regex]::Replace($html, $pattern, $replacement)
    if ($newHtml -ne $html) {
        $html = $newHtml
        $count++
        Write-Host "Zoned: $slug ($zone)"
    } else {
        Write-Host "MISS: $slug"
    }
}

[System.IO.File]::WriteAllText($file, $html, $utf8)
Write-Host "`nPatched $count branches. Done."
