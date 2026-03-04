$utf8 = [System.Text.Encoding]::UTF8
$replacements = @{
    'https://neversaycutz.com/wp-content/uploads/2020/09/banner-7-edited.jpg'                = 'img/hero-banner.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/10/neversaycutz-way-1.jpg'             = 'img/about-barber.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/thonglor-branch-768x432.jpg'        = 'img/about-shop.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/1-gentlemen-haircut.jpg'            = 'img/services/1-gentlemen-haircut.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/2-haircut-and-wash.jpg'             = 'img/services/2-haircut-and-wash.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/3-haircut-shave-beard.jpg'          = 'img/services/3-haircut-shave-beard.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/4-shave-up.jpg'                     = 'img/services/4-shave-up.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/5-bread-trim.jpg'                   = 'img/services/5-bread-trim.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/6-infants-toddlers-1-5-yrs-old.jpg' = 'img/services/6-infants-toddlers.jpg'
    'https://neversaycutz.com/wp-content/uploads/2020/09/8-design.jpg'                       = 'img/services/8-design.jpg'
}

Get-ChildItem -Path "C:\Claude Code\neversaycutz" -Filter '*.html' -File | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName, $utf8)
    $changed = $false
    foreach ($old in $replacements.Keys) {
        if ($content.Contains($old)) {
            $content = $content.Replace($old, $replacements[$old])
            $changed = $true
        }
    }
    if ($changed) {
        [System.IO.File]::WriteAllText($_.FullName, $content, $utf8)
        Write-Host "Updated: $($_.Name)"
    }
}
Write-Host "Done."
