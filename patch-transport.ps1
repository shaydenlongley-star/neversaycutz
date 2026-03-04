# Patch branch pages: remove services table, add Getting Here, add view services link
$dir = "C:\Claude Code\neversaycutz\branches"
$utf8 = [System.Text.Encoding]::UTF8

$transport = @{
  "thonglor"                  = "BTS Thong Lo Station (Exit 3)"
  "sukhumvit-20"              = "BTS Asok Exit 3 / MRT Sukhumvit"
  "sukhumvit-51"              = "BTS Thong Lo Exit 1"
  "onnut"                     = "BTS On Nut Exit 3"
  "ari"                       = "BTS Ari Exit 3, approx. 25m into Soi Ari"
  "siam-square-one"           = "BTS Siam Exit 4"
  "silom"                     = "BTS Sala Daeng / MRT Silom"
  "town-in-town"              = "MRT Rama 9 / Bus 26, 36, 154"
  "ratchayothin"              = "BTS Ratchayothin / MRT Ratchayothin"
  "central-world"             = "BTS Siam Exit 5 via Skywalk"
  "mbk"                       = "BTS National Stadium Exit 4 via skyway"
  "victoria-gardens-bang-kae" = "MRT Lak Song / Bus 84, 123, 183"
  "central-pinklao"           = "BTS Bangyikhan Exit 1 (approx. 1.2km)"
  "don-muang"                 = "Bus 29, 59, 95, 187 / Near Don Muang Airport"
  "the-circle-ratchapruk"     = "BTS Bang Wa Exits 1-2 / MRT Bang Wa Exits 3-4"
  "the-mall-ngamwongwan"      = "BTS Sukhumvit Line / MRT Purple Line"
  "little-walk-bangna"        = "BTS Sri-iam, Yellow Line"
  "lasalle"                   = "BTS Bearing Station"
  "the-crystal-park"          = "Bus 26, 156, 95 / Parking at The Crystal phases 1 & 2"
  "101-true-digital-park"     = "BTS Pun Nawi Exit 6 via Skywalk (approx. 300m)"
  "the-nine-rama-9"           = "MRT Phra Ram 9 / Parking: 4 hrs free, then 20 THB/hr"
  "the-mall-bangkapi"         = "BTS Yellow Line / Klong Saen Saeb boat"
  "the-mall-bangkhae"         = "BTS Blue Line, Luk Luang Exit 4"
  "covehill"                  = "Charoen Krung area / Private vehicle recommended"
  "the-mall-thapra"           = "BTS Talad Phlu Exit 3 (approx. 200m)"
  "muang-thong"               = "Bus 166 / By car approx. 1.2km from Impact Arena"
  "korat"                     = "Inside Terminal 21 Korat / On-site parking"
  "the-bright-rama-ii"        = "BTS Wongwian Yai or Talad Phlu / On-site parking"
  "ptt-prachauthit"           = "Private vehicle / PTT Station, Pracha Uthit-Lad Prao"
  "ptt-vibhavadi"             = "Private vehicle / Vibhavadi Rangsit Rd, before Police Club"
  "ptt-boromratchachonnani"   = "Private vehicle / Boromratchachonnani Rd, Soi 97"
  "market-place-nawamin"      = "BTS Kasetsart University / Bus 156, 178"
  "charn-at-the-avenue"       = "MRT Pink Line, Chaengwattana Station 14"
  "the-quarter-silom"         = "BTS Sala Daeng / MRT Silom"
}

# Transit SVG icon
$transitSvg = '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="5" y="2" width="14" height="18" rx="3"/><circle cx="9" cy="17" r="1" fill="currentColor" stroke="none"/><circle cx="15" cy="17" r="1" fill="currentColor" stroke="none"/><line x1="9" y1="2" x2="9" y2="11"/><line x1="15" y1="2" x2="15" y2="11"/><line x1="5" y1="11" x2="19" y2="11"/></svg>'

# View services link HTML
$viewSvcsHtml = @'

            <div class="branch-view-svcs reveal">
                <a href="../services.html" class="branch-svcs-link">
                    <span class="t-en">View services &amp; pricing</span>
                    <span class="t-th">&#3604;&#3641;&#3610;&#3619;&#3636;&#3585;&#3634;&#3619;&#3649;&#3621;&#3632;&#3619;&#3634;&#3588;&#3634;</span>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </a>
            </div>
'@

foreach ($key in $transport.Keys) {
    $file = Join-Path $dir "$key.html"
    if (-not (Test-Path $file)) { Write-Host "SKIP: $key"; continue }

    $html = [System.IO.File]::ReadAllText($file, $utf8)

    # 1. Remove services strip block (everything from branch-svcs-strip up to branch-cta)
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '(?s)\s+<div class="branch-svcs-strip reveal">.*?(?=\s+<div class="branch-cta)',
        "`n"
    )

    # 2. Insert transport bar before branch-description
    $transportHtml = @"

            <div class="branch-transport reveal">
                <div class="branch-info-label">$transitSvg <span class="t-en">Getting Here</span><span class="t-th">&#3585;&#3634;&#3619;&#3648;&#3604;&#3636;&#3609;&#3607;&#3634;&#3591;</span></div>
                <div class="branch-transport-value">$($transport[$key])</div>
            </div>
"@
    $html = $html.Replace(
        '<div class="branch-description reveal">',
        $transportHtml + "`n            " + '<div class="branch-description reveal">'
    )

    # 3. Insert view-services link after description, before CTA
    $html = $html.Replace(
        '<div class="branch-cta reveal">',
        ($viewSvcsHtml.TrimStart("`n") + "`n`n            " + '<div class="branch-cta reveal">')
    )

    [System.IO.File]::WriteAllText($file, $html, $utf8)
    Write-Host "Patched: $key.html"
}

Write-Host "`nDone."
