-- ============================================
-- SEO OPTIMIZATION - Database Update Queries
-- ============================================
-- Update company_profiles untuk SEO maksimal
-- Copy & paste query yang sesuai kebutuhan
-- 
-- PENTING: Ganti 'techstore-001' dengan company_code Anda!

-- ============================================
-- 1. FULL SEO-OPTIMIZED COMPANY PROFILE
-- ============================================

UPDATE company_profiles
SET 
  -- Display Name: Nama bisnis (max 60 karakter)
  display_name = 'Dunia Computer',
  
  -- Tagline: Slogan/subtitle (max 60 karakter)
  tagline = 'Toko Komputer & Laptop Terpercaya #1 di Indonesia',
  
  -- Description: Deskripsi lengkap (120-160 karakter untuk meta description)
  -- Tips: Sertakan keyword utama, value proposition, dan call-to-action
  description = 'Jual komputer, laptop gaming, PC rakitan, dan aksesoris teknologi dengan harga terbaik. Garansi resmi, cicilan 0%, free konsultasi. Trusted by 10,000+ customers di seluruh Indonesia.',
  
  -- Address: Alamat lengkap (untuk local SEO)
  address = 'Jl. Teknologi Raya No. 123, Jakarta Pusat, DKI Jakarta 10110',
  
  -- Contact Info: Email, phone, WhatsApp, social media
  contact_info = '{
    "email": "duniacomputer@gmail.com",
    "phone": "0822-8444-4399",
    "whatsapp": "082284444399",
    "instagram": "@duniacomputer__",
    "facebook": "@duniacomputerofficial",
    "twitter": "@duniacomputer",
    "tiktok": "@duniacomputerid",
    "youtube": "@duniacomputer",
    "linkedin": "duniacomputer"
  }'::jsonb,
  
  -- Branding: Logo, banner, colors untuk OG image & branding
  branding = '{
    "logo_url": "logos/dunia-computer-logo.png",
    "banner_url": "banners/hero-banner.jpg",
    "og_image": "og-images/main-social-share.jpg",
    "primary_color": "#00f3ff",
    "secondary_color": "#8b5cf6"
  }'::jsonb,
  
  -- About Us (optional, untuk halaman About)
  about_us = 'Dunia Computer adalah toko komputer dan laptop terpercaya yang berdiri sejak 2015. Kami menyediakan berbagai produk teknologi berkualitas dengan harga kompetitif.'

WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');


-- ============================================
-- 2. DESCRIPTION TEMPLATES (Pilih sesuai bisnis)
-- ============================================

-- Template A: Toko Komputer Umum
-- "Toko komputer terlengkap di [Kota]. Jual laptop, PC rakitan, printer, aksesoris gaming dengan harga terbaik. Garansi resmi, cicilan 0%, pengiriman cepat. Melayani retail & grosir sejak [Tahun]."

-- Template B: Fokus Gaming
-- "Specialist laptop gaming & PC rakitan high-end di [Kota]. Build custom gaming rig sesuai budget. RGB setup, peripheral gaming, streaming equipment. Free konsultasi, garansi 2 tahun. Trusted by 5000+ gamers."

-- Template C: Fokus Bisnis/Kantor
-- "Solusi IT untuk bisnis & kantor di [Kota]. Jual komputer kantor, server, networking, CCTV. Instalasi lengkap, after-sales support, maintenance contract. Melayani perusahaan, sekolah, dan instansi pemerintah."

-- Template D: Online Store
-- "Toko laptop & komputer online terpercaya sejak [Tahun]. Produk original bergaransi resmi, harga kompetitif, cicilan 0%. Pengiriman seluruh Indonesia, COD available. Rating 4.9/5 dari 10,000+ customer."


-- ============================================
-- 3. PRODUCT SEO OPTIMIZATION
-- ============================================

-- Example: Laptop Gaming (SEO-Friendly)
INSERT INTO offerings (company_id, title, description, price_label, category, image_path)
VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  
  -- Title: Deskriptif + Keyword (max 60 karakter)
  'Laptop Gaming ASUS ROG Strix G15 RTX 3060 16GB RAM 512GB SSD',
  
  -- Description: Minimal 100 kata, detail specs & benefits
  'Laptop gaming powerful ASUS ROG Strix G15 dengan prosesor Intel Core i7-12700H Gen 12 (14 cores, up to 4.7GHz). GPU NVIDIA GeForce RTX 3060 6GB GDDR6 untuk gaming AAA titles di ultra settings 1080p. RAM 16GB DDR5 4800MHz upgradeable hingga 32GB, SSD NVMe PCIe 4.0 512GB super cepat.
  
  Layar 15.6 inci FHD (1920x1080) IPS-level dengan refresh rate 144Hz dan response time 3ms untuk gameplay smooth tanpa tearing. Keyboard RGB Aura Sync per-key customizable. Cooling system ROG Intelligent Cooling dengan Arc Flow Fans untuk thermal management optimal.
  
  Audio superior dengan 2x 4W speakers + Smart Amp technology, Dolby Atmos, Two-Way AI Noise Cancelation untuk streaming dan conference call. Konektivitas lengkap: Wi-Fi 6E, Bluetooth 5.2, USB-C Thunderbolt 4, HDMI 2.1, RJ45 LAN.
  
  Cocok untuk gaming AAA (Cyberpunk 2077, GTA VI, Elden Ring), editing video 4K (Adobe Premiere, DaVinci Resolve), rendering 3D (Blender, Maya), dan programming heavy workload. Baterai 90Wh untuk produktivitas mobile.
  
  Garansi resmi ASUS Indonesia 2 tahun (parts & service). Free gaming mouse RGB senilai Rp 300.000. Cicilan 0% tersedia untuk kartu kredit pilihan.',
  
  -- Price Label
  'Rp 18.999.000',
  
  -- Category (untuk filtering & keywords)
  'Laptop Gaming',
  
  -- Image
  'products/laptops/asus-rog-strix-g15-2026.jpg'
);

-- Example: PC Rakitan (SEO-Friendly)
INSERT INTO offerings (company_id, title, description, price_label, category)
VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'PC Rakitan Gaming Intel Core i5 Gen 13 RTX 4060 Ti Ultimate',
  'PC rakitan gaming powerful untuk gaming, streaming, editing dengan Intel Core i5-13400F (10 cores, boost 4.6GHz). GPU NVIDIA RTX 4060 Ti 8GB dengan DLSS 3.0 dan Ray Tracing. RAM Corsair Vengeance RGB 16GB DDR5 5600MHz dual channel, upgradeable 64GB. Storage SSD NVMe Gen 4 Samsung 970 EVO Plus 500GB + HDD Seagate 2TB untuk game library.
  
  Motherboard MSI B760M chipset terbaru dengan PCIe 5.0 ready, M.2 heatsink, kontroler LAN Intel 2.5Gbps. Casing NZXT H510 Flow airflow optimal dengan 3x RGB fans intake + 1x exhaust fan. PSU Corsair 650W 80+ Bronze modular untuk cable management rapi.
  
  Cooling system Cooler Master Hyper 212 RGB dengan 4 heatpipes direct contact, thermal paste Arctic MX-4 pre-applied. Temperature idle 30-35°C, gaming load 60-70°C. RGB lighting sync semua komponen via software MSI Mystic Light.
  
  Performance: Gaming 1080p ultra 100+ FPS (Valorant, Apex Legends), 1440p high 60-80 FPS (COD Warzone, Fortnite). Render video 4K 10x lebih cepat vs previous gen. Streaming 1080p 60fps smooth tanpa frame drop.
  
  Include: Windows 11 Home pre-installed & activated, Office 2024, antivirus premium 1 tahun. Full set keyboard gaming RGB mechanical + mouse gaming RGB 12000 DPI. Sudah di-test benchmark 24 jam sebelum dikirim.
  
  Garansi 2 tahun parts, 1 tahun service gratis. Free upgrade component dalam 30 hari. Technical support online 24/7 via WhatsApp.',
  'Rp 14.750.000',
  'PC Rakitan Gaming'
);

-- Example: Laptop Tipis/Office
INSERT INTO offerings (company_id, title, description, price_label, category)
VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'Laptop ASUS Vivobook 14 OLED M3401 Ryzen 5 7530U 16GB SSD 512GB',
  'Laptop productivity premium ASUS Vivobook 14 OLED ultra-thin untuk kerja mobile, kuliah, dan multitasking. Prosesor AMD Ryzen 5 7530U hexa-core (6 cores 12 threads, boost 4.5GHz) efisien dengan TDP 15W untuk battery life maksimal. RAM 16GB DDR4 onboard, SSD NVMe 512GB PCIe 3.0 boot dalam 8 detik.
  
  Layar 14 inci FHD OLED (1920x1080) dengan color gamut 100% DCI-P3, contrast ratio 1,000,000:1, certified VESA DisplayHDR True Black 500. Warna akurat untuk editing foto/video, mata nyaman untuk kerja 8+ jam. Anti-glare coating, blue light filter hardware level.
  
  Desain premium bodi metal dengan ketebalan hanya 17.9mm, bobot 1.4kg mudah dibawa kemana-mana. Keyboard backlit ergonomis dengan key travel 1.4mm nyaman untuk typing cepat. Trackpad precision glass dengan Windows gesture support.
  
  Konektivitas modern: USB-C 3.2 (data + charging + display output), USB-A 3.2, HDMI 2.1 support 4K 60Hz, audio jack 3.5mm combo, microSD card reader. Wi-Fi 6 (802.11ax) 2x2 stable untuk video conference, Bluetooth 5.2.
  
  Audio ASUS SonicMaster dengan AI noise-canceling microphone untuk meeting jernih. Webcam HD 720p dengan privacy shutter. Baterai 42Wh untuk 8 jam productivity, fast charging 60% dalam 49 menit.
  
  Pre-installed Windows 11 Home + Office LTSC 2024 original activated. Software bundle Adobe Acrobat, WPS Office Premium, Antivirus Kaspersky 1 tahun. Garansi global ASUS 2 tahun. Include tas laptop premium + wireless mouse.',
  'Rp 8.499.000',
  'Laptop Productivity'
);


-- ============================================
-- 4. KEYWORDS OPTIMIZATION
-- ============================================

-- Update description dengan keyword variants:
UPDATE company_profiles
SET description = 'Toko komputer Jakarta Pusat terpercaya sejak 2015. Jual laptop murah berkualitas, laptop gaming ASUS ROG MSI Lenovo Legion, PC rakitan custom, komputer kantor lengkap, printer HP Canon Epson, CCTV, networking. Harga kompetitif, garansi resmi distributor, cicilan 0%, free ongkir Jabodetabek. Melayani retail, grosir, perusahaan. Rating 4.9/5 dari 10,000+ pelanggan. Toko fisik + online shop.'
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Tips Keywords:
-- 1. Primary keyword di awal description
-- 2. Include location untuk local SEO (Jakarta, Bandung, Surabaya, dll)
-- 3. Include brand names (ASUS, MSI, Lenovo, HP, Dell, Acer)
-- 4. Include product categories (laptop gaming, PC rakitan, printer, CCTV)
-- 5. Include value props (murah, garansi resmi, cicilan 0%, free ongkir)
-- 6. Include social proof (rating, jumlah customer, tahun berdiri)


-- ============================================
-- 5. CATEGORY & TAGS (Future Enhancement)
-- ============================================

-- Jika ingin tambah category system:
ALTER TABLE offerings ADD COLUMN IF NOT EXISTS category VARCHAR(100);
ALTER TABLE offerings ADD COLUMN IF NOT EXISTS tags TEXT[];
ALTER TABLE offerings ADD COLUMN IF NOT EXISTS brand VARCHAR(50);

-- Update products dengan category & tags
UPDATE offerings
SET 
  category = 'Laptop Gaming',
  tags = ARRAY['gaming', 'asus', 'nvidia', 'rtx', 'high-performance'],
  brand = 'ASUS'
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND title LIKE '%ASUS ROG%';

UPDATE offerings
SET 
  category = 'PC Rakitan Gaming',
  tags = ARRAY['gaming', 'custom', 'intel', 'nvidia', 'rgb'],
  brand = 'Custom Build'
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND title LIKE '%PC Rakitan%';


-- ============================================
-- 6. SEO MONITORING QUERIES
-- ==================== by category
SELECT category, COUNT(*) as total
FROM offerings
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
GROUP BY category;

-- Check products without description (SEO risk!)
SELECT title, LENGTH(description) as desc_length
FROM offerings
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND (description IS NULL OR LENGTH(description) < 100)
ORDER BY desc_length;

-- Check products without images (SEO risk!)
SELECT title, category
FROM offerings
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND image_path IS NULL;

-- Get top keywords from product titles
SELECT 
  unnest(string_to_array(lower(title), ' ')) as word,
  COUNT(*) as frequency
FROM offerings
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
FROM offerings
WHERE company_code = 'techstore-001'
GROUP BY word
HAVING COUNT(*) > 2
ORDER BY frequency DESC
LIMIT 20;


-- ============================================
-- 7. VIEW CURRENT SEO DATA
-- ============================================
c.company_code,
  cp.display_name,
  cp.tagline,
  cp.description,
  LENGTH(cp.description) as desc_length,
  cp.contact_info->>'email' as email,
  cp.contact_info->>'phone' as phone,
  cp.contact_info->>'whatsapp' as whatsapp,
  cp.contact_info->>'instagram' as instagram,
  cp.branding->>'logo_url' as logo,
  cp.branding->>'og_image' as og_image
FROM company_profiles cp
JOIN companies c ON cp.company_id = c.id
WHERE c.ding->>'og_image' as og_image
FROM company_profiles
WHERE company_code = 'techstore-001';


-- ============================================
-- 8. QUICK FIXES
-- ============================================

-- Fix: Description too short
UPDATE companyid = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND LENGTH(description) < 120;

-- Fix: Missing social media
UPDATE company_profiles
SET contact_info = contact_info || '{"instagram": "@yourstore", "facebook": "@yourstore"}'::jsonb
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND contact_info->>'instagram' IS NULL;

-- Fix: Missing branding
UPDATE company_profiles
SET branding = '{"primary_color": "#00f3ff", "secondary_color": "#8b5cf6"}'::jsonb
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
SET branding = '{"primary_color": "#00f3ff", "secondary_color": "#8b5cf6"}'::jsonb
WHERE company_code = 'techstore-001'
  AND branding IS NULL;


-- ============================================
-- DONE! 
-- ============================================
-- Setelah update, refresh website untuk lihat perubahan
-- Cek hasil di:
-- 1. View Page Source → lihat <title> dan <meta> tags
-- 2. Facebook Debugger: https://developers.facebook.com/tools/debug/
-- 3. Twitter Card Validator: https://cards-dev.twitter.com/validator
-- 4. Rich Results Test: https://search.google.com/test/rich-results
