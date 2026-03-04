# Add LocalBusiness JSON-LD schema to all 34 branch pages
$dir = "C:\Claude Code\neversaycutz\branches"
$utf8 = [System.Text.Encoding]::UTF8

# slug -> [name, address, phone, hours, lat, lng, openingHoursSpec]
$branches = [ordered]@{
  "thonglor" = @{
    name="NEVERSAYCUTZ Thonglor"; address="125/34 Soi Sukhumvit 55, Watthana, Bangkok 10110"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7215; lng=100.6068
  }
  "sukhumvit-20" = @{
    name="NEVERSAYCUTZ Sukhumvit 20"; address="10 Sukhumvit Rd, Khlong Toei, Bangkok 10110"
    phone="+66659390136"; hours="Mo-Su 10:00-21:00"; lat=13.7374; lng=100.5601
  }
  "sukhumvit-51" = @{
    name="NEVERSAYCUTZ Sukhumvit 51"; address="Sukhumvit Soi 51, Watthana, Bangkok 10110"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7250; lng=100.6010
  }
  "onnut" = @{
    name="NEVERSAYCUTZ On Nut"; address="Century Movie Plaza, Sukhumvit Soi 77, Phra Khanong, Bangkok 10260"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7050; lng=100.6037
  }
  "ari" = @{
    name="NEVERSAYCUTZ Ari"; address="Soi Ari, Phahon Yothin, Phaya Thai, Bangkok 10400"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7745; lng=100.5479
  }
  "siam-square-one" = @{
    name="NEVERSAYCUTZ Siam Square One"; address="Siam Square One, 388 Rama I Rd, Pathum Wan, Bangkok 10330"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7453; lng=100.5337
  }
  "silom" = @{
    name="NEVERSAYCUTZ Silom"; address="Liberty Square, Silom Rd, Bang Rak, Bangkok 10500"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7259; lng=100.5293
  }
  "town-in-town" = @{
    name="NEVERSAYCUTZ Town in Town"; address="Lat Phrao Rd, Lat Phrao, Bangkok 10230"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7900; lng=100.5950
  }
  "ratchayothin" = @{
    name="NEVERSAYCUTZ Ratchayothin"; address="Avenue Ratchayothin, Phahon Yothin Rd, Lat Yao, Bangkok 10900"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8195; lng=100.5673
  }
  "central-world" = @{
    name="NEVERSAYCUTZ Central World"; address="CentralWorld, 4/1-4/2 Ratchadamri Rd, Pathum Wan, Bangkok 10330"
    phone="+66659280574"; hours="Mo-Su 10:00-22:00"; lat=13.7466; lng=100.5393
  }
  "mbk" = @{
    name="NEVERSAYCUTZ MBK Center"; address="MBK Center, 444 Phayathai Rd, Pathum Wan, Bangkok 10330"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7459; lng=100.5294
  }
  "victoria-gardens-bang-kae" = @{
    name="NEVERSAYCUTZ Victoria Gardens Bang Kae"; address="Victoria Gardens, Petchkasem Rd, Bang Khae, Bangkok 10160"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7018; lng=100.4443
  }
  "central-pinklao" = @{
    name="NEVERSAYCUTZ Central Pinklao"; address="Central Pinklao, 7/222 Boromratchachonnani Rd, Bangkok Noi, Bangkok 10700"
    phone="+66659280574"; hours="Mo-Su 10:00-22:00"; lat=13.7683; lng=100.4806
  }
  "don-muang" = @{
    name="NEVERSAYCUTZ Don Muang"; address="Happy Avenue Don Muang, Don Mueang, Bangkok 10210"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.9130; lng=100.5977
  }
  "the-circle-ratchapruk" = @{
    name="NEVERSAYCUTZ The Circle Ratchapruk"; address="The Circle Ratchaphruek, Bang Wa, Phasi Charoen, Bangkok 10160"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7302; lng=100.4549
  }
  "the-mall-ngamwongwan" = @{
    name="NEVERSAYCUTZ The Mall Ngamwongwan"; address="The Mall Lifestyle Ngamwongwan, Ngam Wong Wan Rd, Mueang Nonthaburi, Nonthaburi 11000"
    phone="+66659280574"; hours="Mo-Th 10:00-21:00; Fr-Sa 10:00-22:00"; lat=13.8324; lng=100.5551
  }
  "little-walk-bangna" = @{
    name="NEVERSAYCUTZ Little Walk Bang Na"; address="Little Walk Bangna, Bang Na, Bangkok 10260"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.6743; lng=100.6108
  }
  "lasalle" = @{
    name="NEVERSAYCUTZ Lasalle"; address="Lasalle Avenue, Lasalle Rd, Bang Na, Bangkok 10260"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.6810; lng=100.6147
  }
  "the-crystal-park" = @{
    name="NEVERSAYCUTZ The Crystal Park"; address="The Crystal Park, Ram Intra Expressway, Khlong Sam Wa, Bangkok 10510"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8346; lng=100.6338
  }
  "101-true-digital-park" = @{
    name="NEVERSAYCUTZ 101 True Digital Park"; address="101 True Digital Park, Sukhumvit Rd, Phra Khanong Nuea, Watthana, Bangkok 10110"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.6882; lng=100.6047
  }
  "the-nine-rama-9" = @{
    name="NEVERSAYCUTZ The Nine Rama 9"; address="The Nine Center Rama 9, Phra Ram 9 Rd, Huai Khwang, Bangkok 10310"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7512; lng=100.5793
  }
  "the-mall-bangkapi" = @{
    name="NEVERSAYCUTZ The Mall Bangkapi"; address="The Mall Bangkapi, 3522 Ladprao Rd, Bang Kapi, Bangkok 10240"
    phone="+66659280574"; hours="Mo-Th 10:00-21:00; Fr-Sa 10:00-22:00"; lat=13.7683; lng=100.6458
  }
  "the-mall-bangkhae" = @{
    name="NEVERSAYCUTZ The Mall Bang Khae"; address="The Mall Lifestore Bang Khae, Petchkasem Rd, Bang Khae, Bangkok 10160"
    phone="+66659280574"; hours="Mo-Th 10:00-21:00; Fr-Sa 10:00-22:00"; lat=13.7029; lng=100.4454
  }
  "covehill" = @{
    name="NEVERSAYCUTZ Cove Hill"; address="Charoen Krung Rd, Bang Rak, Bangkok 10500"
    phone="+66659280574"; hours="Mo-Fr 08:00-20:00; Sa-Su 09:00-20:00"; lat=13.7207; lng=100.4938
  }
  "the-mall-thapra" = @{
    name="NEVERSAYCUTZ The Mall Thapra"; address="The Mall Lifestore Thapra, Ratchadaiphruek Rd, Thon Buri, Bangkok 10600"
    phone="+66659280574"; hours="Mo-Th 10:00-21:00; Fr-Sa 10:00-22:00"; lat=13.7179; lng=100.4892
  }
  "muang-thong" = @{
    name="NEVERSAYCUTZ Muang Thong"; address="Chaengwattana-Pak Kret Soi 33, Pak Kret, Nonthaburi 11120"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8895; lng=100.5551
  }
  "korat" = @{
    name="NEVERSAYCUTZ Korat"; address="Terminal 21 Korat, 99 Mittraphap Rd, Nai Mueang, Mueang Nakhon Ratchasima, Nakhon Ratchasima 30000"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=14.9774; lng=102.0953
  }
  "the-bright-rama-ii" = @{
    name="NEVERSAYCUTZ The Bright Rama II"; address="The Bright Square, 15/9 Rama 2 Rd, Bang Khun Thian, Bangkok 10150"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.6658; lng=100.4840
  }
  "ptt-prachauthit" = @{
    name="NEVERSAYCUTZ PTT Prachauthit-Ladprao"; address="PTT Station Pracha Uthit-Lat Phrao, Bangkok 10230"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7678; lng=100.5845
  }
  "ptt-vibhavadi" = @{
    name="NEVERSAYCUTZ PTT Vibhavadi-Rangsit 62"; address="PTT Station Vibhavadi Rangsit Rd, Don Mueang, Bangkok 10210"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8437; lng=100.5627
  }
  "ptt-boromratchachonnani" = @{
    name="NEVERSAYCUTZ PTT Boromratchachonnani 97"; address="PTT Station Boromratchachonnani Rd Soi 97, Taling Chan, Bangkok 10170"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7743; lng=100.4228
  }
  "market-place-nawamin" = @{
    name="NEVERSAYCUTZ Market Place Nawamin"; address="Market Place Nawamin, Nawamin Rd, Bueng Kum, Bangkok 10230"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8126; lng=100.5929
  }
  "charn-at-the-avenue" = @{
    name="NEVERSAYCUTZ Charn At The Avenue"; address="Charn At The Avenue, Chaengwattana Rd, Pak Kret, Nonthaburi 11120"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.8708; lng=100.5289
  }
  "the-quarter-silom" = @{
    name="NEVERSAYCUTZ The Quarter Silom"; address="The Quarter Silom, Silom Rd, Bang Rak, Bangkok 10500"
    phone="+66659280574"; hours="Mo-Su 10:00-21:00"; lat=13.7294; lng=100.5259
  }
}

foreach ($slug in $branches.Keys) {
    $file = Join-Path $dir "$slug.html"
    if (-not (Test-Path $file)) { Write-Host "SKIP: $slug"; continue }

    $b = $branches[$slug]
    $schema = @"
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BarberShop",
  "name": "$($b.name)",
  "image": "https://shaydenlongley-star.github.io/neversaycutz/img/branches/$slug.jpg",
  "url": "https://shaydenlongley-star.github.io/neversaycutz/branches/$slug.html",
  "telephone": "$($b.phone)",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "$($b.address)",
    "addressCountry": "TH"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": $($b.lat),
    "longitude": $($b.lng)
  },
  "openingHours": "$($b.hours)",
  "priceRange": "฿฿",
  "servesCuisine": null,
  "parentOrganization": {
    "@type": "Organization",
    "name": "NEVERSAYCUTZ",
    "url": "https://shaydenlongley-star.github.io/neversaycutz/",
    "sameAs": [
      "https://www.facebook.com/NeverSayCutz",
      "https://www.instagram.com/neversaycutz/"
    ]
  }
}
</script>
"@

    $html = [System.IO.File]::ReadAllText($file, $utf8)

    # Only insert if not already present
    if ($html -match 'application/ld\+json') {
        Write-Host "Already has schema: $slug"
        continue
    }

    $html = $html.Replace('</head>', "$schema</head>")
    [System.IO.File]::WriteAllText($file, $html, $utf8)
    Write-Host "Schema added: $slug"
}

Write-Host "`nDone."
