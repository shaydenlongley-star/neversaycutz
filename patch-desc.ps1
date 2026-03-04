# Patch branch pages with real copy scraped from neversaycutz.com
$dir = "C:\Claude Code\neversaycutz\branches"
$utf8 = [System.Text.Encoding]::UTF8

$desc = @{
  "thonglor" = "A New York style barber shop in Thailand since 2008. Our Sukhumvit 55 flagship serves a neighbourhood full of convenience with diverse dining and retail. Modern street-style interior with black tones and comfortable seating designed for male customers. Multiple hairstyle options available with our most experienced team. Near BTS Thonglor Station."

  "sukhumvit-20" = "A highly popular branch with over 12 years of successful operations. Simple, accessible design welcoming all demographics. Situated in the bustling Sukhumvit 20 area near Terminal 21 Asok mall, hotels, and diverse dining. Recognisable by the minimalist white storefront approximately 50m past the soi entrance. BTS Asok Exit 3 / MRT Sukhumvit."

  "sukhumvit-51" = "One of NEVERSAYCUTZ's most legendary branches. The Thong Lo area offers diverse dining, accommodation, and a community that includes many Japanese residents. Our expert barbers specialise in diverse hairstyle options for both Thai and expat clients. BTS Thong Lo Exit 1."

  "onnut" = "Serving the growing On Nut area with convenience, numerous amenities, and renowned restaurants nearby. Located on the 3rd floor of Century Movie Plaza, near the Amazon coffee shop. Meticulous haircuts and impressive customer service consistent with every NEVERSAYCUTZ location. Parking at the mall for 20 THB. BTS On Nut Exit 3."

  "ari" = "The Ari district is a hub of hip Bangkok culture and a popular hangout for young people. NEVERSAYCUTZ has operated here for over 10 years, offering premium quality at honest prices. Relaxing atmosphere with neutral-tone decor. Specialising in Undercut, Skinhead, and Two Block styles. BTS Ari Exit 3, approximately 25m into Soi Ari."

  "siam-square-one" = "Set in one of Bangkok's most fashionable shopping districts, this branch features our distinctive blue and orange design with hip-hop music throughout. On the 2nd floor, directly opposite Onitsuka store. Advance booking strongly recommended at this high-traffic central location. BTS Siam Station Exit 4."

  "silom" = "The Silom business district is home to many of Bangkok's leading companies and tourist attractions. NEVERSAYCUTZ Silom attracts the area's office workers for expert haircut designs including Undercut, Skinhead, and Two Block cuts. Located in Liberty Square on Silom Road. BTS Sala Daeng / MRT Silom."

  "town-in-town" = "Specialising in fade techniques, skin head cuts, undercuts, and Korean Two Block styles. Also offering beard trimming, beard styling, and hair tattoo designs for all ages. Located opposite Park Town In Town shopping center on Lat Phrao 94 Road."

  "ratchayothin" = "Inside Avenue Ratchayothin, one of Bangkok's most vibrant commercial zones experiencing rapid growth in business and real estate. Parking available at Avenue Ratchayothin. BTS Phaholyothin 24 and Ratchayothin stations / MRT Ratchayothin."

  "central-world" = "Right at the heart of Bangkok in one of its most iconic malls. Distinctive blue and orange design with a hip-hop atmosphere and titanium styling tools. Open until 22:00. BTS Siam Station Exit 5 via Skywalk, connecting to Central World on Level 3."

  "mbk" = "MBK Center is an inclusive shopping landmark offering diverse fashion, IT products, souvenirs, and hundreds of restaurants. Find us on the 4th Floor, Zone A Mobile & IT, near the escalators. BTS National Stadium Exit 4 via skyway. MRT Silom line via connecting walkway."

  "victoria-gardens-bang-kae" = "Bang Khae is increasingly accessible via the MRT Blue Line extension to Lak Song station. The neighbourhood features markets, department stores, companies, and hospitals. Victoria Gardens sits on Petchkasem Road between Phutthamonthon Sai 2 and 3. Our shop is on the left of the internal roundabout, directly opposite Foodland."

  "central-pinklao" = "Full barber services for men including beard shaving, moustache grooming, and design work on the 3rd floor of Central Pinklao. Pinklao is one of the prominent areas on the Thonburi side, well connected by bus and BTS. Open until 22:00."

  "don-muang" = "New York style barbering with minimal modern design, emphasising attentive service and detailed haircuts tailored to each customer. Inside Happy Avenue Don Muang next to Cafe Amazon, serving the community around Don Muang International Airport. Parking available at the mall."

  "the-circle-ratchapruk" = "A desirable neighbourhood featuring residential developments, condominiums, schools, and shopping centres. The Circle community mall has restaurants, cafes, and fashion boutiques throughout. Our branch is next to UOB Bank. Advance booking recommended. BTS Bang Wa Exits 1-2 / MRT Bang Wa Exits 3-4."

  "the-mall-ngamwongwan" = "Ngamwongwan is a trendy area with complete amenities and convenient transport. Located on Level 3 in the Men's Zone of The Mall Lifestyle Ngamwongwan, appealing to Bangkok residents seeking diverse lifestyle services. Accessible via BTS Sukhumvit Line and MRT Purple Line."

  "little-walk-bangna" = "Serving the rapidly expanding eastern Bangkok district, with complete facilities, hospitals, shopping centres, and a dense residential community nearby. We offer meticulous and detailed haircuts in the style customers desire. BTS Sri-iam Yellow Line / parking at Little Walk Bangna."

  "lasalle" = "The Lasalle-Bearing area is continuously growing with improved BTS connections, shops, restaurants, and premium residential projects. Full amenities including schools, hospitals, and condominiums in the neighbourhood. Inside Lasalle Avenue on Lasalle Road. BTS Bearing Station."

  "the-crystal-park" = "New York style barbering since 2008 offering customised hair design services. Located in The Crystal Park, an upscale community mall along the Ram-Inthra expressway connecting multiple Bangkok districts. Parking at The Crystal community mall phases 1 and 2."

  "101-true-digital-park" = "101 True Digital Park is Bangkok's premier lifestyle destination for the tech generation, featuring offices, co-working spaces, retail, restaurants, and fitness facilities. Our branch is on the 1st floor in the 24-Hour Street zone, directly opposite Kao Gub Pla restaurant. BTS Pun Nawi Exit 6 via Skywalk (approx. 300m)."

  "the-nine-rama-9" = "Distinctive blue and orange brand design with hip-hop atmosphere in the East Village zone of The Nine Center. Community mall addressing lifestyle needs for all ages. Located on the Ground Floor opposite Est.33 restaurant in the thriving Rama 9 corridor."

  "the-mall-bangkapi" = "Newly renovated barbershop featuring a modern appearance tailored for teenagers and working professionals. The Mall Bangkapi has been reimagined as a new shopping hub for eastern Bangkok's residents after major renovations. Extended hours Friday and Saturday until 22:00. Yellow Line BTS / Klong Saen Saeb boat service."

  "the-mall-bangkhae" = "Blue-toned modern interior at The Mall Lifestore Bang Khae on Petchkasem Road. Easy BTS Blue Line access via Luk Luang Station Exit 4, with a covered walkway directly into the mall. Serves all age groups. Extended hours Friday and Saturday until 22:00."

  "covehill" = "Unique in the NEVERSAYCUTZ family for its earlier hours, suited to the lifestyle of the Charoen Krung neighbourhood. Open from 08:00 on weekdays and 09:00 on weekends. A refined experience in one of Bangkok's most storied riverside districts."

  "the-mall-thapra" = "Barber services at The Mall Lifestore Thapra in Thon Buri District. Extended hours Friday and Saturday until 22:00. BTS Talad Phlu Exit 3, approximately 200-300m to the entrance. Parking within the mall."

  "muang-thong" = "Serving the large residential community of Muang Thong Thani on Chaengwattana Road, adjacent to Mr. Latte coffee shop in Soi Chaengwattana-Pak Kret 33. Personalised haircut design services for every male client. Parking directly in front of the shop. Approximately 1.2km from Impact Arena."

  "korat" = "Bringing New York style to the Northeast. Nakhon Ratchasima is the gateway to the Northeast, and we operate inside Terminal 21 Korat, the city's most prominent shopping centre at 99 Mittraphap Road. Parking at Terminal 21 Korat."

  "the-bright-rama-ii" = "NEVERSAYCUTZ Mobile Barber Shop featuring a vintage atmosphere in the creative activity area at The Bright Square on Rama II Road. The Rama II area connects Bangkok with nearby provinces and is home to diverse dining and amenities. Ground floor, 15/9 Rama 2 Road."

  "ptt-prachauthit" = "Container-format barbershop at the PTT Pracha Uthit-Lad Prao petrol station. New York style precision cuts in a compact, innovative format. Easy roadside access in one of Bangkok's busiest intersections. Open daily 10:00-21:00."

  "ptt-vibhavadi" = "Container-format barbershop on Vibhavadi Rangsit Road before the Police Club intersection. Convenient access for those commuting from Rangsit and Don Muang by private vehicle. New York style since 2008. Open daily 10:00-21:00."

  "ptt-boromratchachonnani" = "Container-format location at PTT Station Boromratchachonnani 97 in western Bangkok. Bringing the NEVERSAYCUTZ standard to every neighbourhood in a compact, convenient format. New York style since 2008. Open daily 10:00-21:00."

  "market-place-nawamin" = "The Nawamin area is a rapidly growing business district and NEVERSAYCUTZ has established itself as a leading men's haircut destination here. Located within Market Place Nawamin alongside restaurants, cafes, and shopping. Haircut design in the style you desire with professional, heartfelt service. BTS Kasetsart University."

  "charn-at-the-avenue" = "A lifestyle hub on Chaengwattana Road, surrounded by government offices, educational institutions, hotels, and hospitals. Located in Building A of Charn At The Avenue complex. Access via Pink Line MRT at Chaengwattana Station 14. One standard across over 30 branches nationwide."

  "the-quarter-silom" = "NEVERSAYCUTZ in the heart of Bangkok's financial and entertainment district. Silom is the city's premier business corridor and our Quarter Silom location brings New York style precision to the neighbourhood. Open daily 10:00-21:00."
}

foreach ($key in $desc.Keys) {
    $file = Join-Path $dir "$key.html"
    if (-not (Test-Path $file)) { Write-Host "SKIP: $key"; continue }

    $html = [System.IO.File]::ReadAllText($file, $utf8)

    # Replace the description paragraph content
    $newDesc = $desc[$key]
    $html = [System.Text.RegularExpressions.Regex]::Replace(
        $html,
        '<div class="branch-description reveal"><p>[^<]*</p></div>',
        "<div class=`"branch-description reveal`"><p>$newDesc</p></div>"
    )

    [System.IO.File]::WriteAllText($file, $html, $utf8)
    Write-Host "Updated desc: $key.html"
}

Write-Host "`nDone."
