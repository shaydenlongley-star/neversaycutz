$file = "C:\Claude Code\neversaycutz\locations.html"
$html = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$old = 'href="https://www.google.com/maps/search/NEVERSAYCUTZ+Cove+Hill" target="_blank" rel="noopener" class="loc-name-link"'
$new = 'href="branches/covehill.html" class="loc-name-link"'
if ($html.Contains($old)) {
    $html = $html.Replace($old, $new)
    Write-Host "Replaced Cove Hill"
} else {
    Write-Host "NOT FOUND"
}
[System.IO.File]::WriteAllText($file, $html, [System.Text.Encoding]::UTF8)
