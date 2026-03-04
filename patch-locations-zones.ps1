# Add data-zone + data-slug to each card, make loc-maps-icon a link,
# and insert zone filter toolbar + Find Nearest button into locations.html

$file = "C:\Claude Code\neversaycutz\locations.html"
$utf8 = [System.Text.Encoding]::UTF8
$html = [System.IO.File]::ReadAllText($file, $utf8)

# ── 1. Zone + slug per branch
# zone values: sukhumvit | city-centre | north | west | province
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

# Maps URLs (same as patch-loc-links.ps1)
$maps = [ordered]@{
    "thonglor"                  = "https://www.google.com/maps/search/NEVERSAYCUTZ+Thonglor+Sukhumvit+55+Bangkok"
    "sukhumvit-20"              = "https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+20+Bangkok"
    "sukhumvit-51"              = "https://www.google.com/maps/search/NEVERSAYCUTZ+Sukhumvit+51+Thong+Lo+Bangkok"
    "onnut"                     = "https://www.google.com/maps/search/NEVERSAYCUTZ+On+Nut+Century+Movie+Plaza+Bangkok"
    "ari"                       = "https://www.google.com/maps/search/NEVERSAYCUTZ+Ari+Bangkok"
    "siam-square-one"           = "https://www.google.com/maps/search/NEVERSAYCUTZ+Siam+Square+One+Bangkok"
    "silom"                     = "https://www.google.com/maps/search/NEVERSAYCUTZ+Silom+Liberty+Square+Bangkok"
    "town-in-town"              = "https://www.google.com/maps/search/NEVERSAYCUTZ+Town+In+Town+Lat+Phrao+Bangkok"
    "ratchayothin"              = "https://www.google.com/maps/search/NEVERSAYCUTZ+Avenue+Ratchayothin+Bangkok"
    "central-world"             = "https://www.google.com/maps/search/NEVERSAYCUTZ+CentralWorld+Bangkok"
    "mbk"                       = "https://www.google.com/maps/search/NEVERSAYCUTZ+MBK+Center+Bangkok"
    "victoria-gardens-bang-kae" = "https://www.google.com/maps/search/NEVERSAYCUTZ+Victoria+Gardens+Bang+Khae+Bangkok"
    "central-pinklao"           = "https://www.google.com/maps/search/NEVERSAYCUTZ+Central+Pinklao+Bangkok"
    "don-muang"                 = "https://www.google.com/maps/search/NEVERSAYCUTZ+Don+Muang+Happy+Avenue+Bangkok"
    "the-circle-ratchapruk"     = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Circle+Ratchapruk+Bangkok"
    "the-mall-ngamwongwan"      = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Ngamwongwan+Nonthaburi"
    "little-walk-bangna"        = "https://www.google.com/maps/search/NEVERSAYCUTZ+Little+Walk+Bang+Na+Bangkok"
    "lasalle"                   = "https://www.google.com/maps/search/NEVERSAYCUTZ+Lasalle+Avenue+Bangkok"
    "the-crystal-park"          = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Crystal+Park+Ram+Intra+Bangkok"
    "101-true-digital-park"     = "https://www.google.com/maps/search/NEVERSAYCUTZ+101+True+Digital+Park+Bangkok"
    "the-nine-rama-9"           = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Nine+Center+Rama+9+Bangkok"
    "the-mall-bangkapi"         = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bangkapi+Bangkok"
    "the-mall-bangkhae"         = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Bang+Khae+Bangkok"
    "covehill"                  = "https://www.google.com/maps/search/NEVERSAYCUTZ+Cove+Hill+Charoen+Krung+Bangkok"
    "the-mall-thapra"           = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Mall+Thapra+Bangkok"
    "muang-thong"               = "https://www.google.com/maps/search/NEVERSAYCUTZ+Muang+Thong+Thani+Chaengwattana+Nonthaburi"
    "korat"                     = "https://www.google.com/maps/search/NEVERSAYCUTZ+Terminal+21+Korat+Nakhon+Ratchasima"
    "the-bright-rama-ii"        = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Bright+Rama+2+Bangkok"
    "ptt-prachauthit"           = "https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Pracha+Uthit+Lat+Phrao+Bangkok"
    "ptt-vibhavadi"             = "https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Vibhavadi+Rangsit+Bangkok"
    "ptt-boromratchachonnani"   = "https://www.google.com/maps/search/NEVERSAYCUTZ+PTT+Boromratchachonnani+97+Bangkok"
    "market-place-nawamin"      = "https://www.google.com/maps/search/NEVERSAYCUTZ+Market+Place+Nawamin+Bangkok"
    "charn-at-the-avenue"       = "https://www.google.com/maps/search/NEVERSAYCUTZ+Charn+At+The+Avenue+Chaengwattana+Bangkok"
    "the-quarter-silom"         = "https://www.google.com/maps/search/NEVERSAYCUTZ+The+Quarter+Silom+Bangkok"
}

foreach ($slug in $zones.Keys) {
    $zone = $zones[$slug]

    # Add data-zone and data-slug to the card div (match by loc-card-img-link href)
    $html = $html.Replace(
        "<div class=`"location-card location-card--link`">`n                        <a href=`"branches/$slug.html`" class=`"loc-card-img-link`">",
        "<div class=`"location-card location-card--link`" data-zone=`"$zone`" data-slug=`"$slug`">`n                        <a href=`"branches/$slug.html`" class=`"loc-card-img-link`">"
    )
    # Also handle location-card--mobile variant
    $html = $html.Replace(
        "<div class=`"location-card location-card--link location-card--mobile`">`n                        <a href=`"branches/$slug.html`" class=`"loc-card-img-link`">",
        "<div class=`"location-card location-card--link location-card--mobile`" data-zone=`"$zone`" data-slug=`"$slug`">`n                        <a href=`"branches/$slug.html`" class=`"loc-card-img-link`">"
    )

    # Make loc-maps-icon a link (it appears once per card, near the maps href for this slug)
    # We target the span that follows the loc-name-link for this slug
    if ($maps.Contains($slug)) {
        $mapsUrl = $maps[$slug]
        # The icon span appears after the loc-name-link for this slug's card.
        # We find the pattern unique to this card: the name link href followed eventually by the icon span.
        # Simple approach: the maps icon is always the same SVG, so we pair it with the nearby name link.
        # Replace <span class="loc-maps-icon"> that is near this slug's Maps URL
        $markerOld = "href=`"$mapsUrl`" target=`"_blank`" rel=`"noopener`" class=`"loc-name-link`""
        # We'll use a block-level replace strategy: find the card anchor block and replace span with anchor
        # Since each card is unique by slug in data-slug we already added, just do a global span->a replace
        # but we can only do it if the span is next to the name link in the same card.
        # Safest: use regex to match the icon span only within the same card block
    }

    Write-Host "Zoned: $slug ($zone)"
}

# ── 2. Convert all loc-maps-icon spans to links
# Each span appears right after the card body with the Maps name link.
# Replace <span class="loc-maps-icon">SVG</span> with <a class="loc-maps-icon" href="..." ...>SVG</a>
# We do this per-card by matching name link href -> find next loc-maps-icon span and wrap
foreach ($slug in $maps.Keys) {
    $mapsUrl = $maps[$slug]
    $iconSvg = '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"/><polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/></svg>'
    $oldSpan = "<span class=`"loc-maps-icon`">$iconSvg</span>"
    $newAnchor = "<a href=`"$mapsUrl`" target=`"_blank`" rel=`"noopener`" class=`"loc-maps-icon`" aria-label=`"Open in Maps`">$iconSvg</a>"

    # Only replace the first occurrence after this slug's name link
    # Since each card has a unique maps URL in the name link, find that URL then replace the next icon span
    $idx = $html.IndexOf("href=`"$mapsUrl`"")
    if ($idx -ge 0) {
        $iconIdx = $html.IndexOf($oldSpan, $idx)
        if ($iconIdx -ge 0 -and $iconIdx - $idx -lt 600) {
            $html = $html.Substring(0, $iconIdx) + $newAnchor + $html.Substring($iconIdx + $oldSpan.Length)
        }
    }
}

# ── 3. Insert zone filter toolbar before first locations-region
$filterBar = @'

            <!-- ZONE FILTER -->
            <div class="zone-filter reveal">
                <button class="zone-btn active" data-zone="all">
                    <span class="t-en">All</span>
                    <span class="t-th">ทั้งหมด</span>
                </button>
                <button class="zone-btn" data-zone="sukhumvit">
                    <span class="t-en">Sukhumvit</span>
                    <span class="t-th">สุขุมวิท</span>
                </button>
                <button class="zone-btn" data-zone="city-centre">
                    <span class="t-en">City Centre</span>
                    <span class="t-th">ใจกลางเมือง</span>
                </button>
                <button class="zone-btn" data-zone="north">
                    <span class="t-en">North Bangkok</span>
                    <span class="t-th">กรุงเทพเหนือ</span>
                </button>
                <button class="zone-btn" data-zone="west">
                    <span class="t-en">West &amp; South</span>
                    <span class="t-th">ตะวันตก &amp; ใต้</span>
                </button>
                <button class="zone-btn" data-zone="province">
                    <span class="t-en">Outside Bangkok</span>
                    <span class="t-th">ต่างจังหวัด</span>
                </button>
                <button class="zone-btn zone-btn--locate" id="findNearest">
                    <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3"/><path d="M12 2a10 10 0 1 0 0 20A10 10 0 0 0 12 2z" stroke-width="1.5"/></svg>
                    <span class="t-en">Find Nearest</span>
                    <span class="t-th">หาสาขาใกล้ฉัน</span>
                </button>
            </div>

'@

$html = $html.Replace(
    "            <!-- BANGKOK BRANCHES -->",
    $filterBar + "            <!-- BANGKOK BRANCHES -->"
)

[System.IO.File]::WriteAllText($file, $html, $utf8)
Write-Host "`nDone."
