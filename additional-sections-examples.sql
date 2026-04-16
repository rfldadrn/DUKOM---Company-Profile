-- =============================================
-- Additional Sections Examples
-- untuk Futuristic Landing Page
-- =============================================

-- =============================================
-- EXAMPLE 1: FAQ Section (Accordion Style)
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'faq',
  'Pertanyaan yang Sering Diajukan',
  '{
    "items": [
      {
        "question": "Berapa lama waktu pengerjaan?",
        "answer": "3-7 hari kerja tergantung tingkat kesulitan dan ketersediaan komponen."
      },
      {
        "question": "Apakah bisa custom design?",
        "answer": "Tentu! Kami menerima custom design sesuai keinginan Anda. Konsultasikan kebutuhan Anda dengan tim kami."
      },
      {
        "question": "Apakah ada garansi?",
        "answer": "Semua produk kami bergaransi resmi dari distributor. Masa garansi berbeda-beda tergantung produk."
      },
      {
        "question": "Metode pembayaran apa saja yang diterima?",
        "answer": "Kami menerima transfer bank, kartu kredit/debit, e-wallet, dan cicilan 0% untuk kartu kredit tertentu."
      },
      {
        "question": "Apakah melayani pengiriman ke luar kota?",
        "answer": "Ya, kami melayani pengiriman ke seluruh Indonesia menggunakan ekspedisi terpercaya."
      }
    ]
  }'::jsonb,
  1
);

-- =============================================
-- EXAMPLE 2: Warranty/Benefits Section (Card Grid)
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'warranty',
  'Jaminan & Layanan',
  '{
    "items": [
      {
        "icon": "🛡️",
        "title": "Garansi Resmi",
        "description": "Semua produk bergaransi resmi distributor dengan masa garansi sesuai ketentuan."
      },
      {
        "icon": "💬",
        "title": "After Sales Support",
        "description": "Free konsultasi selamanya untuk customer. Tim kami siap membantu troubleshooting."
      },
      {
        "icon": "🔧",
        "title": "Service Center",
        "description": "Layanan perbaikan dan maintenance dengan teknisi berpengalaman."
      },
      {
        "icon": "📦",
        "title": "Upgrade Guarantee",
        "description": "Tukar tambah komponen lama dengan yang baru. Dapatkan harga spesial untuk upgrade."
      }
    ]
  }'::jsonb,
  2
);

-- =============================================
-- EXAMPLE 3: Company Stats/Numbers
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'stats',
  'Trusted by Thousands',
  '{
    "items": [
      {
        "value": "10K+",
        "title": "Happy Customers",
        "description": "Satisfied tech enthusiasts"
      },
      {
        "value": "5K+",
        "title": "Products Sold",
        "description": "Premium hardware delivered"
      },
      {
        "value": "98%",
        "title": "Satisfaction Rate",
        "description": "Based on customer reviews"
      },
      {
        "value": "24/7",
        "title": "Support",
        "description": "Always ready to help"
      }
    ]
  }'::jsonb,
  1
);

-- EXAMPLE 4: Why Choose Us (Alternative Features)
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'features',
  'Why Choose TechStore?',
  '{
    "items": [
      {
        "icon": "✅",
        "title": "Authentic Products",
        "description": "100% original products with official warranty from authorized distributors"
      },
      {
        "icon": "🚚",
        "title": "Free Shipping",
        "description": "Free delivery for Jakarta area on purchases above 5 million rupiah"
      },
      {
        "icon": "💳",
        "title": "0% Installment",
        "description": "Installment options available for various credit cards"
      },
      {
        "icon": "🛠️",
        "title": "After Sales Service",
        "description": "Expert technicians ready to help with installation and troubleshooting"
      }
    ]
  }'::jsonb,
  2
);

-- EXAMPLE 5: Brands We Carry
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'brands',
  'Official Partners',
  '{
    "items": [
      {"name": "ASUS ROG", "icon": "🎮"},
      {"name": "MSI", "icon": "⚡"},
      {"name": "Razer", "icon": "🐍"},
      {"name": "Logitech", "icon": "🖱️"},
      {"name": "Corsair", "icon": "⚔️"},
      {"name": "NVIDIA", "icon": "💚"},
      {"name": "AMD", "icon": "🔴"},
      {"name": "Intel", "icon": "💙"}
    ]
  }'::jsonb,
  3
);

-- EXAMPLE 6: Custom HTML Content
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'about',
  'About Our Store',
  '{
    "html": "<p style=\"font-size: 1.1rem; line-height: 1.8; text-align: center;\">TechStore has been serving the tech community since 2015. We specialize in high-performance computing solutions for gamers, content creators, and professionals. Our team of experts is passionate about technology and committed to helping you find the perfect setup for your needs.</p>"
  }'::jsonb,
  4
);

-- EXAMPLE 7: Services/Offerings Text
-- =============================================
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'services',
  'Our Services',
  '{
    "items": [
      {
        "icon": "🔧",
        "title": "Custom PC Building",
        "description": "We build custom PCs tailored to your specific needs and budget"
      },
      {
        "icon": "⚡",
        "title": "PC Upgrade",
        "description": "Upgrade your existing PC with latest components for better performance"
      },
      {
        "icon": "🔍",
        "title": "Free Consultation",
        "description": "Not sure what to buy? Our experts provide free consultation"
      },
      {
        "icon": "📦",
        "title": "Installation Service",
        "description": "Professional installation and setup service available"
      }
    ]
  }'::jsonb,
  5
);

-- =============================================
-- Verification Query
-- =============================================
SELECT 
  section_key,
  section_title,
  display_order,
  content
FROM additional_sections
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order;

-- =============================================
-- Delete All Additional Sections (if needed)
-- =============================================
-- DELETE FROM additional_sections 
-- WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');
