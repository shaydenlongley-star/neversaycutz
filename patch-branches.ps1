# Patch all 34 branch pages: add Thai names, bilingual tags, and services section
$dir = "C:\Claude Code\neversaycutz\branches"

# Branch file -> Thai name (HTML entities, ASCII-safe)
$nameTh = @{
  "thonglor"                  = "&#3607;&#3629;&#3591;&#3627;&#3621;&#3656;&#3629;"
  "sukhumvit-20"              = "&#3626;&#3640;&#3586;&#3640;&#3617;&#3623;&#3636;&#3607; 20"
  "sukhumvit-51"              = "&#3626;&#3640;&#3586;&#3640;&#3617;&#3623;&#3636;&#3607; 51"
  "onnut"                     = "&#3629;&#3656;&#3629;&#3609;&#3609;&#3640;&#3594;"
  "ari"                       = "&#3629;&#3634;&#3619;&#3637;&#3618;&#3660;"
  "siam-square-one"           = "&#3626;&#3618;&#3634;&#3617;&#3626;&#3649;&#3588;&#3623;&#3619;&#3660;&#3623;&#3633;&#3609;"
  "silom"                     = "&#3626;&#3637;&#3621;&#3617;"
  "town-in-town"              = "&#3607;&#3634;&#3623;&#3609;&#3660;&#3629;&#3636;&#3609;&#3607;&#3634;&#3623;&#3609;&#3660;"
  "ratchayothin"              = "&#3619;&#3633;&#3594;&#3650;&#3618;&#3608;&#3636;&#3609;"
  "central-world"             = "&#3648;&#3595;&#3655;&#3609;&#3607;&#3619;&#3633;&#3621;&#3648;&#3623;&#3636;&#3621;&#3604;&#3660;"
  "mbk"                       = "MBK &#3648;&#3595;&#3655;&#3609;&#3648;&#3605;&#3629;&#3619;&#3660;"
  "victoria-gardens-bang-kae" = "&#3623;&#3636;&#3588;&#3605;&#3629;&#3648;&#3619;&#3637;&#3618;&#3634; &#3585;&#3634;&#3619;&#3660;&#3648;&#3604;&#3657;&#3609; &#3610;&#3634;&#3591;&#3649;&#3588;"
  "central-pinklao"           = "&#3648;&#3595;&#3655;&#3609;&#3607;&#3619;&#3633;&#3621; &#3611;&#3636;&#3656;&#3609;&#3648;&#3585;&#3621;&#3657;&#3634;"
  "don-muang"                 = "&#3604;&#3629;&#3609;&#3648;&#3617;&#3639;&#3629;&#3591;"
  "the-circle-ratchapruk"     = "&#3648;&#3604;&#3629;&#3632;&#3648;&#3595;&#3629;&#3619;&#3660;&#3648;&#3588;&#3636;&#3621; &#3619;&#3634;&#3594;&#3614;&#3620;&#3585;&#3625;&#3660;"
  "the-mall-ngamwongwan"      = "&#3648;&#3604;&#3629;&#3632;&#3617;&#3629;&#3621;&#3621;&#3660; &#3591;&#3634;&#3617;&#3623;&#3591;&#3624;&#3660;&#3623;&#3634;&#3609;"
  "little-walk-bangna"        = "&#3621;&#3636;&#3605;&#3648;&#3605;&#3636;&#3657;&#3621;&#3623;&#3629;&#3621;&#3660;&#3588; &#3610;&#3634;&#3591;&#3609;&#3634;"
  "lasalle"                   = "&#3621;&#3634;&#3649;&#3595;&#3621;"
  "the-crystal-park"          = "&#3648;&#3604;&#3629;&#3632;&#3588;&#3619;&#3636;&#3626;&#3605;&#3633;&#3621; &#3614;&#3634;&#3619;&#3660;&#3588; &#3619;&#3634;&#3617;&#3629;&#3636;&#3609;&#3607;&#3619;&#3634;"
  "101-true-digital-park"     = "101 &#3607;&#3619;&#3641; &#3604;&#3636;&#3592;&#3636;&#3607;&#3633;&#3621; &#3614;&#3634;&#3619;&#3660;&#3588;"
  "the-nine-rama-9"           = "&#3648;&#3604;&#3629;&#3632;&#3652;&#3609;&#3609;&#3660; &#3614;&#3619;&#3632;&#3619;&#3634;&#3617; 9"
  "the-mall-bangkapi"         = "&#3648;&#3604;&#3629;&#3632;&#3617;&#3629;&#3621;&#3621;&#3660; &#3610;&#3634;&#3591;&#3585;&#3632;&#3611;&#3636;"
  "the-mall-bangkhae"         = "&#3648;&#3604;&#3629;&#3632;&#3617;&#3629;&#3621;&#3621;&#3660; &#3610;&#3634;&#3591;&#3649;&#3588;"
  "covehill"                  = "&#3650;&#3588;&#3615; &#3630;&#3636;&#3621;&#3621;&#3660;"
  "the-mall-thapra"           = "&#3648;&#3604;&#3629;&#3632;&#3617;&#3629;&#3621;&#3621;&#3660; &#3607;&#3656;&#3634;&#3614;&#3619;&#3632;"
  "muang-thong"               = "&#3648;&#3617;&#3639;&#3629;&#3591;&#3607;&#3629;&#3591;"
  "korat"                     = "&#3650;&#3588;&#3619;&#3634;&#3594;"
  "the-bright-rama-ii"        = "&#3648;&#3604;&#3629;&#3632;&#3652;&#3610;&#3619;&#3607;&#3660; &#3614;&#3619;&#3632;&#3619;&#3634;&#3617; 2"
  "ptt-prachauthit"           = "&#3611;&#3605;&#3607;. &#3611;&#3619;&#3632;&#3594;&#3634;&#3629;&#3640;&#3607;&#3636;&#3624;-&#3621;&#3634;&#3604;&#3614;&#3619;&#3657;&#3634;&#3623;"
  "ptt-vibhavadi"             = "&#3611;&#3605;&#3607;. &#3623;&#3636;&#3616;&#3634;&#3623;&#3604;&#3637;-&#3619;&#3633;&#3591;&#3626;&#3636;&#3605; 62"
  "ptt-boromratchachonnani"   = "&#3611;&#3605;&#3607;. &#3610;&#3619;&#3617;&#3619;&#3634;&#3594;&#3594;&#3609;&#3609;&#3637; 97"
  "market-place-nawamin"      = "&#3617;&#3634;&#3619;&#3660;&#3648;&#3585;&#3655;&#3605;&#3648;&#3614;&#3621;&#3626; &#3609;&#3623;&#3617;&#3636;&#3609;&#3607;&#3619;&#3660;"
  "charn-at-the-avenue"       = "&#3594;&#3634;&#3609; &#3649;&#3629;&#3607; &#3648;&#3604;&#3629;&#3632; &#3629;&#3648;&#3623;&#3609;&#3636;&#3623;"
  "the-quarter-silom"         = "&#3648;&#3604;&#3629;&#3632; &#3588;&#3623;&#3629;&#3648;&#3605;&#3629;&#3619;&#3660; &#3626;&#3637;&#3621;&#3617;"
}

# Services section to insert before branch-cta
$servicesBlock = @'
            <div class="branch-svcs-strip reveal">
                <div class="branch-svcs-header">
                    <p class="section-label"><span class="t-en">AT THIS LOCATION</span><span class="t-th">&#3610;&#3619;&#3636;&#3585;&#3634;&#3619;&#3586;&#3629;&#3591;&#3626;&#3634;&#3586;&#3634;&#3609;&#3637;&#3657;</span></p>
                    <h2><span class="t-en">Our Services</span><span class="t-th">&#3610;&#3619;&#3636;&#3585;&#3634;&#3619;</span></h2>
                </div>
                <div class="branch-svcs-grid">
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Gentlemen&#39;s Haircut</strong><strong class="bsvc-name t-th">&#3605;&#3633;&#3604;&#3612;&#3617;&#3626;&#3640;&#3616;&#3634;&#3614;&#3610;&#3640;&#3619;&#3640;&#3625;</strong><span class="bsvc-desc t-en"> &mdash; classic, modern or textured</span></div>
                        <span class="bsvc-price">&#3647;600</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Haircut and Wash</strong><strong class="bsvc-name t-th">&#3605;&#3633;&#3604;&#3612;&#3617;&#3649;&#3621;&#3632;&#3626;&#3619;&#3632;</strong><span class="bsvc-desc t-en"> &mdash; precision cut + wash &amp; style</span></div>
                        <span class="bsvc-price">&#3647;650</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Haircut + Shave + Beard</strong><strong class="bsvc-name t-th">&#3605;&#3633;&#3604; + &#3650;&#3585;&#3609; + &#3648;&#3588;&#3619;&#3634;</strong><span class="bsvc-desc t-en"> &mdash; complete grooming package</span></div>
                        <span class="bsvc-price">&#3647;1,000</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Shape Up</strong><strong class="bsvc-name t-th">&#3648;&#3594;&#3615;&#3629;&#3633;&#3614;</strong><span class="bsvc-desc t-en"> &mdash; wash, set, style, eyebrows</span></div>
                        <span class="bsvc-price">&#3647;450</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Beard Trim</strong><strong class="bsvc-name t-th">&#3605;&#3585;&#3649;&#3605;&#3656;&#3591;&#3648;&#3588;&#3619;&#3634;</strong><span class="bsvc-desc t-en"> &mdash; shape up + sharp lines &amp; clean edges</span></div>
                        <span class="bsvc-price">&#3647;600</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Infants &amp; Toddlers</strong><strong class="bsvc-name t-th">&#3648;&#3604;&#3655;&#3585;&#3607;&#3634;&#3619;&#3585;&#3649;&#3621;&#3632;&#3648;&#3604;&#3655;&#3585;&#3648;&#3621;&#3655;&#3585;</strong><span class="bsvc-desc t-en"> &mdash; ages 1&ndash;10, gentle &amp; fun</span></div>
                        <span class="bsvc-price">&#3647;450</span>
                    </div>
                    <div class="branch-svc-row">
                        <div><strong class="bsvc-name t-en">Hair Designs</strong><strong class="bsvc-name t-th">&#3649;&#3585;&#3632;&#3621;&#3634;&#3618;</strong><span class="bsvc-desc t-en"> &mdash; lines, patterns &amp; custom artwork</span></div>
                        <span class="bsvc-price t-en">from &#3647;650</span><span class="bsvc-price t-th">&#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609; &#3647;650</span>
                    </div>
                </div>
                <div style="text-align:center;margin-top:36px">
                    <a href="../services.html" class="btn btn-outline"><span class="t-en">View Full Service Menu</span><span class="t-th">&#3604;&#3641;&#3610;&#3619;&#3636;&#3585;&#3634;&#3619;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;</span></a>
                </div>
            </div>

'@

$utf8 = [System.Text.Encoding]::UTF8

foreach ($key in $nameTh.Keys) {
    $file = Join-Path $dir "$key.html"
    if (-not (Test-Path $file)) { Write-Host "SKIP (not found): $key"; continue }

    $html = [System.IO.File]::ReadAllText($file, $utf8)

    # 1. Replace <h1>NAME</h1> with bilingual h1
    # Match <h1>anything</h1> and replace
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '<h1>([^<]+)</h1>',
        '<h1><span class="t-en">$1</span><span class="t-th">' + $nameTh[$key] + '</span></h1>'
    )

    # 2. Fix type tags (add Thai)
    $html = $html.Replace(
        '<span class="branch-tag branch-tag-branch">Branch</span>',
        '<span class="branch-tag branch-tag-branch"><span class="t-en">Branch</span><span class="t-th">&#3626;&#3634;&#3586;&#3634;</span></span>'
    )
    $html = $html.Replace(
        '<span class="branch-tag branch-tag-mobile">Mobile Unit</span>',
        '<span class="branch-tag branch-tag-mobile"><span class="t-en">Mobile Unit</span><span class="t-th">&#3627;&#3609;&#3656;&#3623;&#3618;&#3650;&#3617;&#3610;&#3634;&#3618;</span></span>'
    )
    $html = $html.Replace(
        '<span class="branch-tag branch-tag-container">Container</span>',
        '<span class="branch-tag branch-tag-container"><span class="t-en">Container</span><span class="t-th">&#3588;&#3629;&#3609;&#3648;&#3607;&#3609;&#3648;&#3609;&#3629;&#3619;&#3660;</span></span>'
    )

    # 3. Fix hours tag (add Thai)
    $html = $html.Replace(
        '<span class="branch-hours-tag">Open Daily</span>',
        '<span class="branch-hours-tag"><span class="t-en">Open Daily</span><span class="t-th">&#3648;&#3611;&#3636;&#3604;&#3607;&#3640;&#3585;&#3623;&#3633;&#3609;</span></span>'
    )

    # 4. Insert services block before branch-cta div
    $html = $html.Replace(
        '            <div class="branch-cta reveal">',
        $servicesBlock + '            <div class="branch-cta reveal">'
    )

    [System.IO.File]::WriteAllText($file, $html, $utf8)
    Write-Host "Patched: $key.html"
}

Write-Host "`nDone."
