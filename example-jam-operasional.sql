-- ============================================
-- ADDITIONAL SECTIONS EXAMPLE: JAM OPERASIONAL
-- ============================================
-- Contoh lengkap untuk menambahkan section jam buka/tutup
-- dengan berbagai variasi tampilan

-- ============================================
-- VARIASI 1: Card Grid Style (RECOMMENDED)
-- ============================================
-- Akan render sebagai card grid dengan icon

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'jam-operasional',                    -- Custom key
  'Jam Operasional Toko',               -- Title yang tampil
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
        "description": "09:00 - 21:00 WIB\nBuka lebih lama di weekend untuk kenyamanan Anda"
      },
      {
        "icon": "🕒",
        "title": "Minggu & Tanggal Merah",
        "description": "10:00 - 18:00 WIB\nTetap buka untuk kebutuhan mendesak Anda"
      },
      {
        "icon": "📍",
        "title": "Lokasi",
        "description": "Jl. Teknologi Raya No. 123, Jakarta Pusat\nMudah diakses dengan transportasi umum"
      }
    ]
  }'::jsonb,
  1                                      -- Display order (tampil pertama)
);


-- ============================================
-- VARIASI 2: Detailed Schedule dengan Stats Style
-- ============================================
-- Menggunakan section_key 'stats' untuk tampilan big numbers

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'stats',                              -- Use stats template
  'Kami Siap Melayani Anda',
  '{
    "items": [
      {
        "value": "7",
        "title": "Hari Seminggu",
        "description": "Buka setiap hari termasuk weekend"
      },
      {
        "value": "12",
        "title": "Jam Per Hari",
        "description": "Waktu operasional untuk melayani Anda"
      },
      {
        "value": "365",
        "title": "Hari Setahun",
        "description": "Hanya tutup saat hari raya besar"
      },
      {
        "value": "24/7",
        "title": "Online Support",
        "description": "Customer service via WhatsApp selalu siap"
      }
    ]
  }'::jsonb,
  2
);


-- ============================================
-- VARIASI 3: Custom HTML dengan Detail Lengkap
-- ============================================
-- Untuk tampilan yang lebih custom dengan table atau styling khusus

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'operating-hours',
  'Jam Operasional & Lokasi',
  '{
    "html": "<div style=\"max-width: 900px; margin: 0 auto;\"><div style=\"display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 2rem; margin-bottom: 3rem;\"><div style=\"background: rgba(0, 243, 255, 0.05); padding: 2rem; border-radius: 16px; border: 1px solid rgba(0, 243, 255, 0.2);\"><h3 style=\"color: var(--neon-cyan); margin-bottom: 1.5rem; font-size: 1.5rem;\">🏪 Toko Offline</h3><table style=\"width: 100%; color: var(--text-secondary); line-height: 2;\"><tr><td style=\"font-weight: 600;\">Senin - Jumat</td><td style=\"text-align: right; color: var(--neon-cyan);\">09:00 - 20:00</td></tr><tr><td style=\"font-weight: 600;\">Sabtu</td><td style=\"text-align: right; color: var(--neon-cyan);\">09:00 - 21:00</td></tr><tr><td style=\"font-weight: 600;\">Minggu</td><td style=\"text-align: right; color: var(--neon-cyan);\">10:00 - 18:00</td></tr><tr><td style=\"font-weight: 600;\">Tanggal Merah</td><td style=\"text-align: right; color: var(--neon-pink);\">10:00 - 18:00</td></tr></table></div><div style=\"background: rgba(139, 92, 246, 0.05); padding: 2rem; border-radius: 16px; border: 1px solid rgba(139, 92, 246, 0.2);\"><h3 style=\"color: var(--neon-purple); margin-bottom: 1.5rem; font-size: 1.5rem;\">💬 Customer Service</h3><table style=\"width: 100%; color: var(--text-secondary); line-height: 2;\"><tr><td style=\"font-weight: 600;\">WhatsApp</td><td style=\"text-align: right; color: var(--neon-cyan);\">24/7 Online</td></tr><tr><td style=\"font-weight: 600;\">Instagram DM</td><td style=\"text-align: right; color: var(--neon-cyan);\">24/7 Online</td></tr><tr><td style=\"font-weight: 600;\">Phone</td><td style=\"text-align: right; color: var(--neon-cyan);\">09:00 - 20:00</td></tr><tr><td style=\"font-weight: 600;\">Email</td><td style=\"text-align: right; color: var(--neon-cyan);\">Response 1x24 jam</td></tr></table></div></div><div style=\"background: rgba(255, 255, 255, 0.03); padding: 2rem; border-radius: 16px; border: 1px solid rgba(255, 255, 255, 0.1); text-align: center;\"><h3 style=\"color: var(--text-primary); margin-bottom: 1rem; font-size: 1.3rem;\">📍 Alamat Lengkap</h3><p style=\"color: var(--text-secondary); font-size: 1.1rem; line-height: 1.8; margin-bottom: 1.5rem;\">Jl. Teknologi Raya No. 123, Blok A-5<br>Jakarta Pusat, DKI Jakarta 10110<br>Indonesia</p><p style=\"color: var(--neon-cyan); font-size: 0.95rem;\">🚇 5 menit dari Stasiun MRT Bundaran HI<br>🚌 Dekat halte Busway Sarinah<br>🅿️ Parkir gratis tersedia</p></div><div style=\"margin-top: 2rem; padding: 1.5rem; background: rgba(0, 255, 136, 0.05); border-radius: 12px; border-left: 4px solid var(--neon-green);\"><p style=\"color: var(--text-secondary); text-align: center; margin: 0;\">⚠️ <strong style=\"color: var(--neon-green);\">Info Penting:</strong> Kami tutup pada tanggal 1-2 Januari (Tahun Baru) dan 1-3 Lebaran. Untuk info terbaru, cek Instagram <a href=\"https://instagram.com/duniacomputer__\" style=\"color: var(--neon-cyan); text-decoration: none;\">@duniacomputer__</a></p></div></div>"
  }'::jsonb,
  3
);


-- ============================================
-- VARIASI 4: Kombinasi dengan FAQ
-- ============================================
-- Menggabungkan jam operasional dengan pertanyaan umum

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'faq',                                -- Use FAQ template (accordion)
  'Informasi Kunjungan & Layanan',
  '{
    "items": [
      {
        "question": "🕐 Jam berapa toko buka?",
        "answer": "Toko kami buka Senin-Jumat pukul 09:00-20:00 WIB, Sabtu 09:00-21:00 WIB, dan Minggu/Tanggal Merah 10:00-18:00 WIB. Kami buka setiap hari kecuali tanggal merah nasional tertentu."
      },
      {
        "question": "📍 Dimana lokasi toko?",
        "answer": "Toko berlokasi di Jl. Teknologi Raya No. 123, Jakarta Pusat. Mudah diakses dengan MRT (5 menit dari Bundaran HI), Busway (halte Sarinah), atau kendaraan pribadi dengan parkir gratis tersedia."
      },
      {
        "question": "🅿️ Apakah tersedia parkir?",
        "answer": "Ya, kami menyediakan area parkir gratis untuk mobil dan motor. Parkir basement kami dapat menampung hingga 50 kendaraan. Akses parkir 24 jam dengan security."
      },
      {
        "question": "💬 Bisa konsultasi via online dulu?",
        "answer": "Tentu! Anda bisa konsultasi via WhatsApp, Instagram DM, atau email sebelum berkunjung. Tim kami siap membantu memilihkan produk yang sesuai kebutuhan dan budget Anda. WhatsApp kami available 24/7."
      },
      {
        "question": "🚚 Apakah bisa pesan online & diantar?",
        "answer": "Ya, kami melayani pemesanan online dengan pengiriman ke seluruh Indonesia. Untuk area Jabodetabek, gratis ongkir untuk pembelian di atas Rp 5 juta. Same-day delivery tersedia untuk pemesanan sebelum jam 14:00."
      },
      {
        "question": "🔧 Apakah ada layanan instalasi?",
        "answer": "Ya, kami menyediakan layanan instalasi dan setup gratis untuk pembelian PC rakitan. Untuk laptop, kami bantu install software basic gratis. Layanan maintenance dan upgrade juga tersedia dengan biaya terjangkau."
      }
    ]
  }'::jsonb,
  4
);


-- ============================================
-- VARIASI 5: Dengan Google Maps Embed (Custom HTML)
-- ============================================
-- Include peta Google Maps untuk kemudahan navigasi

INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'location-map',
  'Temukan Kami',
  '{
    "html": "<div style=\"max-width: 1000px; margin: 0 auto;\"><div style=\"display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;\"><div><h3 style=\"color: var(--neon-cyan); margin-bottom: 1rem; font-size: 1.3rem;\">📍 Alamat</h3><p style=\"color: var(--text-secondary); line-height: 1.8; margin-bottom: 1.5rem;\">Jl. Teknologi Raya No. 123, Blok A-5<br>Jakarta Pusat, DKI Jakarta 10110<br>Indonesia</p><h3 style=\"color: var(--neon-cyan); margin-bottom: 1rem; font-size: 1.3rem;\">🚇 Akses Transportasi</h3><ul style=\"color: var(--text-secondary); line-height: 2; list-style: none; padding: 0;\"><li>✅ MRT: 5 menit jalan kaki dari Bundaran HI</li><li>✅ Busway: Halte Sarinah (200m)</li><li>✅ KRL: Stasiun Gondangdia (10 menit)</li><li>✅ Parkir: Gratis untuk pengunjung</li></ul></div><div><h3 style=\"color: var(--neon-cyan); margin-bottom: 1rem; font-size: 1.3rem;\">🕐 Jam Operasional</h3><table style=\"width: 100%; color: var(--text-secondary); line-height: 2;\"><tr><td style=\"font-weight: 600;\">Senin - Jumat</td><td style=\"color: var(--neon-cyan); text-align: right;\">09:00 - 20:00</td></tr><tr><td style=\"font-weight: 600;\">Sabtu</td><td style=\"color: var(--neon-cyan); text-align: right;\">09:00 - 21:00</td></tr><tr><td style=\"font-weight: 600;\">Minggu</td><td style=\"color: var(--neon-cyan); text-align: right;\">10:00 - 18:00</td></tr></table><h3 style=\"color: var(--neon-cyan); margin: 1.5rem 0 1rem; font-size: 1.3rem;\">📞 Kontak</h3><ul style=\"color: var(--text-secondary); line-height: 2; list-style: none; padding: 0;\"><li>📱 WhatsApp: +62 822-8444-4399</li><li>📧 Email: duniacomputer@gmail.com</li><li>📷 Instagram: @duniacomputer__</li></ul></div></div><div style=\"border-radius: 16px; overflow: hidden; border: 2px solid rgba(0, 243, 255, 0.2); box-shadow: 0 0 30px rgba(0, 243, 255, 0.1);\"><iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.6664827614973!2d106.82493261476889!3d-6.176174895527234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f5d2e764b12d%3A0x3d2ad6e1e0e9bcc8!2sBundaran%20HI!5e0!3m2!1sen!2sid!4v1234567890\" width=\"100%\" height=\"400\" style=\"border:0; display: block;\" allowfullscreen=\"\" loading=\"lazy\"></iframe></div><p style=\"text-align: center; margin-top: 1.5rem; color: var(--text-secondary); font-size: 0.95rem;\">💡 Tidak menemukan lokasi? Hubungi kami via WhatsApp untuk panduan arah</p></div>"
  }'::jsonb,
  5
);


-- ============================================
-- VIEW/CHECK RESULTS
-- ============================================

-- Lihat semua additional sections yang sudah dibuat
SELECT 
  section_key,
  section_title,
  display_order,
  LENGTH(content::text) as content_size
FROM additional_sections
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order;


-- ============================================
-- DELETE/CLEANUP (Jika mau hapus untuk testing ulang)
-- ============================================

-- Hapus semua additional sections untuk company ini
-- DELETE FROM additional_sections 
-- WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Hapus hanya section tertentu berdasarkan key
-- DELETE FROM additional_sections 
-- WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
--   AND section_key = 'jam-operasional';


-- ============================================
-- TIPS & BEST PRACTICES
-- ============================================

/*
PILIHAN TERBAIK UNTUK JAM OPERASIONAL:

1. VARIASI 1 (Card Grid) - RECOMMENDED untuk informasi quick & clean
   ✅ Visual menarik dengan icon
   ✅ Easy to read
   ✅ Responsive otomatis
   ⚠️ Terbatas customization

2. VARIASI 3 (Custom HTML) - BEST untuk detail lengkap
   ✅ Full control styling
   ✅ Bisa include table, color coding, etc
   ✅ Professional look
   ⚠️ Perlu maintain HTML

3. VARIASI 4 (FAQ) - BEST untuk kombinasi info + Q&A
   ✅ Interactive accordion
   ✅ Hemat space
   ✅ User-friendly untuk mobile
   ⚠️ Harus format Q&A

4. VARIASI 5 (With Map) - ULTIMATE untuk toko fisik
   ✅ Google Maps embedded
   ✅ Complete location info
   ✅ Best untuk local business
   ⚠️ Perlu update map embed URL

KOMBINASI IDEAL:
- Gunakan VARIASI 1 untuk quick info di landing page
- Tambah VARIASI 5 (map) untuk section terpisah "Lokasi & Kontak"
- Total 2 sections, display_order = 1 dan 2

NOTES:
- Ganti company_code 'techstore-001' dengan code Anda
- Sesuaikan jam, alamat, kontak dengan data real
- Untuk Google Maps: Generate embed code dari Google Maps → Share → Embed
- Test di mobile untuk memastikan responsive
- Max 5-6 additional sections total untuk UX optimal
*/
