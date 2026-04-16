-- =============================================
-- Sample Data: TechStore (Toko Komputer)
-- Insert data demo untuk testing frontend
-- =============================================

-- PENTING: Jalankan schema.sql terlebih dahulu!

-- =============================================
-- 1. Insert Company
-- =============================================
INSERT INTO companies (company_code, industry_type)
VALUES ('techstore-001', 'retail_technology')
ON CONFLICT (company_code) DO NOTHING;

-- Get the company ID (untuk reference)
DO $$
DECLARE
  v_company_id UUID;
BEGIN
  SELECT id INTO v_company_id FROM companies WHERE company_code = 'techstore-001';

  -- =============================================
  -- 2. Insert Company Profile
  -- =============================================
  INSERT INTO company_profiles (
    company_id,
    display_name,
    address,
    contact_info,
    branding,
    about_us,
    vision_mission,
    additional_info
  ) VALUES (
    v_company_id,
    'TechStore Computer Center',
    'Jl. Sudirman No. 123, Jakarta Pusat 10220',
    '{
      "phone": "+62 21 1234 5678",
      "email": "info@techstore.com",
      "whatsapp": "+62 812 3456 7890",
      "instagram": "@techstore.id",
      "website": "www.techstore.com"
    }'::jsonb,
    '{
      "primary_color": "#2563eb",
      "secondary_color": "#0ea5e9",
      "logo_url": "",
      "banner_url": ""
    }'::jsonb,
    'TechStore adalah toko komputer terpercaya di Jakarta yang menyediakan berbagai macam komputer, laptop, dan aksesoris teknologi berkualitas tinggi. Dengan pengalaman lebih dari 10 tahun, kami berkomitmen memberikan produk terbaik dengan harga kompetitif dan layanan purna jual yang memuaskan.',
    '{
      "vision": "Menjadi toko komputer terpercaya dan terlengkap di Indonesia dengan standar pelayanan internasional.",
      "mission": [
        "Menyediakan produk teknologi berkualitas tinggi dengan harga terjangkau",
        "Memberikan konsultasi gratis untuk membantu pelanggan memilih produk yang tepat",
        "Melayani dengan ramah dan profesional",
        "Menjaga kepuasan pelanggan melalui layanan purna jual yang excellent"
      ]
    }'::jsonb,
    '{
      "opening_hours": "Senin - Sabtu: 09.00 - 18.00, Minggu: 10.00 - 16.00",
      "payment_methods": ["Cash", "Transfer Bank", "Kartu Kredit/Debit", "QRIS"],
      "warranty": "Garansi resmi untuk semua produk"
    }'::jsonb
  )
  ON CONFLICT (company_id) DO UPDATE SET
    display_name = EXCLUDED.display_name,
    address = EXCLUDED.address,
    contact_info = EXCLUDED.contact_info,
    about_us = EXCLUDED.about_us,
    vision_mission = EXCLUDED.vision_mission;

  -- =============================================
  -- 3. Insert Offerings (Products)
  -- =============================================
  
  -- Product 1: Gaming Laptop
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Gaming Laptop ASUS ROG Strix G15',
    'Laptop gaming dengan AMD Ryzen 7, RTX 3060, RAM 16GB, SSD 512GB. Cocok untuk gaming dan editing video.',
    'Rp 18.999.000',
    'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400',
    1,
    true
  );

  -- Product 2: Office Laptop
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Lenovo ThinkPad X1 Carbon',
    'Laptop bisnis ultra-tipis dengan Intel i7 Gen 11, RAM 16GB, SSD 1TB. Perfect untuk profesional.',
    'Rp 22.500.000',
    'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=400',
    2,
    true
  );

  -- Product 3: Desktop PC
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Desktop PC Rakitan Core i5',
    'PC rakitan untuk kantor: Intel Core i5 Gen 12, RAM 16GB, SSD 512GB, monitor 24 inch included.',
    'Rp 9.500.000',
    'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=400',
    3,
    true
  );

  -- Product 4: MacBook
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'MacBook Air M2 2024',
    'MacBook Air terbaru dengan chip M2, RAM 16GB, SSD 512GB. Cocok untuk desainer dan developer.',
    'Rp 21.999.000',
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    4,
    true
  );

  -- Product 5: Gaming Monitor
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Monitor Gaming LG UltraGear 27"',
    '27 inch QHD, 165Hz refresh rate, 1ms response time, G-Sync compatible. Perfect untuk gaming.',
    'Rp 4.299.000',
    'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400',
    5,
    true
  );

  -- Product 6: Mechanical Keyboard
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Logitech G Pro X Mechanical Keyboard',
    'Keyboard gaming mechanical dengan RGB lighting, hot-swappable switch, tournament-grade.',
    'Rp 2.199.000',
    'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400',
    6,
    true
  );

  -- Product 7: Gaming Mouse
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Razer DeathAdder V3 Pro',
    'Mouse gaming wireless dengan sensor 30K DPI, battery life 90 jam, ergonomic design.',
    'Rp 1.899.000',
    'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400',
    7,
    true
  );

  -- Product 8: External SSD
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Samsung T7 Portable SSD 1TB',
    'External SSD ultra-fast dengan transfer speed up to 1050MB/s, USB 3.2 Gen 2, compact design.',
    'Rp 1.799.000',
    'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400',
    8,
    true
  );

  -- Product 9: Webcam
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'Logitech Brio 4K Webcam',
    'Webcam 4K Ultra HD dengan HDR, autofocus, noise-cancelling mic. Perfect untuk WFH dan streaming.',
    'Rp 2.999.000',
    'https://images.unsplash.com/photo-1614624532983-4ce03382d63d?w=400',
    9,
    true
  );

  -- Product 10: Printer
  INSERT INTO offerings (
    company_id, title, description, price_label, image_path, display_order, is_active
  ) VALUES (
    v_company_id,
    'HP LaserJet Pro M404dn',
    'Printer laser mono dengan print speed 40ppm, duplex printing, network-ready. Untuk kantor.',
    'Rp 4.599.000',
    'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=400',
    10,
    true
  );

  -- =============================================
  -- 4. Insert Additional Sections (Optional)
  -- =============================================
  
  -- Features/Keunggulan Section
  INSERT INTO additional_sections (
    company_id, section_key, section_title, content, display_order
  ) VALUES (
    v_company_id,
    'features',
    'Mengapa Memilih TechStore?',
    '{
      "items": [
        {
          "icon": "✅",
          "title": "Produk Original",
          "description": "Semua produk dijamin 100% original dengan garansi resmi"
        },
        {
          "icon": "🚚",
          "title": "Gratis Ongkir",
          "description": "Free shipping untuk area Jabodetabek pembelian di atas 5 juta"
        },
        {
          "icon": "💳",
          "title": "Cicilan 0%",
          "description": "Tersedia cicilan 0% untuk berbagai kartu kredit"
        },
        {
          "icon": "🛠️",
          "title": "After Sales Service",
          "description": "Tim teknisi siap membantu instalasi dan troubleshooting"
        }
      ]
    }'::jsonb,
    1
  );

END $$;

-- =============================================
-- Verification Queries
-- =============================================

-- Check inserted data
SELECT 'Companies:' as info, COUNT(*) as count FROM companies WHERE company_code = 'techstore-001'
UNION ALL
SELECT 'Profiles:', COUNT(*) FROM company_profiles 
  WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
UNION ALL
SELECT 'Offerings:', COUNT(*) FROM offerings 
  WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- =============================================
-- Success Message
-- =============================================
SELECT '✅ Sample data untuk TechStore berhasil diinsert!' as message;
SELECT '🚀 Sekarang buka frontend di browser dan ubah config.js sesuai Supabase Anda.' as next_step;
