# Patch branch pages with correct opening hours
$dir = "C:\Claude Code\neversaycutz\branches"
$utf8 = [System.Text.Encoding]::UTF8

# slug -> [hours display text, meta description hours]
$hours = @{
    # Standard 10-21 (most branches - no change needed, but confirm)
    # Extended until 22:00
    "central-world"           = "Daily 10:00 - 22:00"
    "central-pinklao"         = "Daily 10:00 - 22:00"
    # Extended Fri/Sat
    "the-mall-bangkapi"       = "Daily 10:00 - 21:00, Fri & Sat until 22:00"
    "the-mall-bangkhae"       = "Daily 10:00 - 21:00, Fri & Sat until 22:00"
    "the-mall-thapra"         = "Daily 10:00 - 21:00, Fri & Sat until 22:00"
    "the-mall-ngamwongwan"    = "Daily 10:00 - 21:00, Fri & Sat until 22:00"
    # Covehill - earlier open
    "covehill"                = "Weekdays 08:00 - 20:00 / Weekends 09:00 - 20:00"
    # PTT container branches
    "ptt-prachauthit"         = "Daily 10:00 - 21:00"
    "ptt-vibhavadi"           = "Daily 10:00 - 21:00"
    "ptt-boromratchachonnani" = "Daily 10:00 - 21:00"
    # Others with specified hours from descriptions
    "the-quarter-silom"       = "Daily 10:00 - 21:00"
    "the-bright-rama-ii"      = "Daily 10:00 - 21:00"
}

foreach ($slug in $hours.Keys) {
    $file = Join-Path $dir "$slug.html"
    if (-not (Test-Path $file)) { Write-Host "SKIP: $slug"; continue }

    $html = [System.IO.File]::ReadAllText($file, $utf8)
    $newHours = $hours[$slug]

    # Replace the hours value in the info grid
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '(<div class="branch-info-label">[^<]*<svg[^>]+>[^<]*</svg>[^<]*<span class="t-en">Hours</span>.*?</div>\s*<div class="branch-info-value">)([^<]+)(</div>)',
        "`$1$newHours`$3",
        [System.Text.RegularExpressions.RegexOptions]::Singleline
    )

    [System.IO.File]::WriteAllText($file, $html, $utf8)
    Write-Host "Hours updated: $slug -> $newHours"
}

Write-Host "`nDone."
