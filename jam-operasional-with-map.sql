-- ============================================
-- JAM OPERASIONAL - Card Grid + Google Maps
-- ============================================
-- Kombinasi card grid simple dengan interactive map
-- Best of both worlds: Clean info + easy navigation

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'cp-dukom-pdg'),
  'jam-operasional',
  'Kunjungi Toko Kami',
  '{
    "items": [
      {
        "icon": "🕐",
        "title": "Senin - Jumat",
        "description": "09:00 - 20:00 WIB\nBuka setiap hari kerja untuk melayani Anda"
      },
      {
        "icon": "🕑",
        "title": "Sabtu",
        "description": "09:00 - 21:00 WIB\nBuka lebih lama di weekend"
      },
      {
        "icon": "🕒",
        "title": "Minggu & Tanggal Merah",
        "description": "10:00 - 18:00 WIB\nTetap buka untuk kebutuhan mendesak"
      },
      {
        "icon": "📍",
        "title": "Lokasi Toko",
        "description": "Jl. Teknologi Raya No. 123\nJakarta Pusat, DKI Jakarta 10110"
      },
      {
        "icon": "🚇",
        "title": "Akses Transportasi",
        "description": "5 menit dari MRT Bundaran HI\nDekat halte Busway Sarinah"
      },
      {
        "icon": "🅿️",
        "title": "Parkir Gratis",
        "description": "Area parkir luas untuk mobil & motor\nAman dengan CCTV 24 jam"
      },
      {
        "icon": "💬",
        "title": "Customer Service",
        "description": "WhatsApp 24/7: 0822-8444-4399\nInstagram: @duniacomputer__"
      },
      {
        "icon": "🚚",
        "title": "Delivery Available",
        "description": "Gratis ongkir Jabodetabek min. Rp 5 juta\nPengiriman ke seluruh Indonesia"
      }
    ],
    "map": {
      "embed_url": "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.2882135264335!2d100.36038597496511!3d-0.934001499056967!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2fd4b925cd8f6b03%3A0x4c8d55256210ace7!2sDunia%20Computer!5e0!3m2!1sid!2sid!4v1776332817447!5m2!1sid!2sid",
      "title": "Temukan Kami di Google Maps",
      "description": "Klik untuk membuka di Google Maps & dapatkan arah ke toko kami"
    }
  }'::jsonb,
  1
);

-- ============================================
-- CARA GANTI GOOGLE MAPS EMBED URL:
-- ============================================
/*
1. Buka Google Maps (https://maps.google.com)
2. Cari alamat toko Anda
3. Klik tombol "Share" (tombol berbagi)
4. Pilih tab "Embed a map"
5. Copy kode iframe yang muncul
6. Extract URL dari src="..." 
7. Paste ke "embed_url" di atas

CONTOH IFRAME DARI GOOGLE:
<iframe src="https://www.google.com/maps/embed?pb=!1m18..." width="600" height="450"></iframe>

AMBIL BAGIAN INI SAJA:
https://www.google.com/maps/embed?pb=!1m18...

TIPS:
- Pastikan URL diawali dengan https://www.google.com/maps/embed
- Jangan pakai URL biasa (maps.google.com/xyz) - harus embed URL
- Test dulu di browser apakah URL valid
*/

-- ============================================
-- CUSTOMIZATION GUIDE
-- ============================================

-- 1. GANTI COMPANY CODE
-- Ganti 'techstore-001' dengan company_code Anda

-- 2. SESUAIKAN JAM OPERASIONAL
-- Edit bagian "description" di setiap item

-- 3. UPDATE ALAMAT
-- Edit item dengan icon "📍" dan "🚇"

-- 4. GANTI KONTAK
-- Edit WhatsApp number dan Instagram username

-- 5. UPDATE GOOGLE MAPS
-- Ganti "embed_url" dengan URL dari lokasi Anda

-- ============================================
-- VERIFICATION QUERY
-- ============================================

-- Cek apakah data sudah masuk
SELECT 
  section_key,
  section_title,
  content->>'map' IS NOT NULL as has_map,
  jsonb_array_length(content->'items') as total_items,
  display_order
FROM additional_sections
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
  AND section_key = 'jam-operasional';

-- Expected result:
-- section_key        | jam-operasional
-- section_title      | Kunjungi Toko Kami
-- has_map            | true
-- total_items        | 8
-- display_order      | 1

-- ============================================
-- DELETE/CLEANUP (jika perlu reset)
-- ============================================

-- DELETE FROM additional_sections 
-- WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
--   AND section_key = 'jam-operasional';
