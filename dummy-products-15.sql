-- =============================================
-- Dummy Data: 15 Products untuk Testing
-- Tema: Toko Komputer
-- =============================================

-- PENTING: Pastikan sudah ada company dengan code 'techstore-001'
-- Jika belum, jalankan sample-data-techstore.sql terlebih dahulu

-- Hapus offerings lama (optional, untuk clean start)
-- DELETE FROM offerings WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Insert 15 Dummy Products
INSERT INTO offerings (company_id, title, description, price_label, image_path, display_order, is_active)
VALUES
-- 1. Gaming Laptops
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'ASUS ROG Strix G16',
    'Gaming laptop dengan Intel Core i9-13980HX, RTX 4070 8GB, RAM 32GB DDR5, SSD 1TB NVMe. Display 16" QHD 240Hz.',
    'Rp 28.999.000',
    'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400',
    1,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'MSI Katana 15 B13V',
    'Intel i7-13700H, RTX 4060 8GB, RAM 16GB, SSD 512GB. Gaming laptop affordable dengan performa tinggi.',
    'Rp 16.499.000',
    'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=400',
    2,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Acer Predator Helios Neo 16',
    'Intel i7-13700HX, RTX 4060 8GB, 16GB RAM, 1TB SSD. Cooling system superior untuk gaming marathon.',
    'Rp 19.999.000',
    'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=400',
    3,
    true
),

-- 2. Productivity Laptops
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'MacBook Air M2 2024',
    'Apple M2 chip, 16GB RAM, 512GB SSD. Perfect untuk creative professionals dan developers.',
    'Rp 21.999.000',
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    4,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Lenovo ThinkPad X1 Carbon Gen 11',
    'Intel i7-1365U, 32GB RAM, 1TB SSD. Premium business laptop dengan build quality terbaik.',
    'Rp 24.500.000',
    'https://images.unsplash.com/photo-1588702547919-26089e690ecc?w=400',
    5,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Dell XPS 15 9530',
    'Intel i7-13700H, RTX 4050, 16GB RAM, 512GB SSD. Display 3.5K OLED touchscreen yang memukau.',
    'Rp 26.999.000',
    'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?w=400',
    6,
    true
),

-- 3. Desktop PC / Rakitan
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'PC Gaming Ryzen 7 7800X3D',
    'AMD Ryzen 7 7800X3D, RTX 4070 Ti 12GB, 32GB DDR5, 1TB NVMe. Beast untuk gaming dan content creation.',
    'Rp 32.500.000',
    'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=400',
    7,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'PC Office Intel i5-13400',
    'Intel Core i5-13400, Intel UHD 730, 16GB RAM, 512GB SSD. Hemat listrik untuk perkantoran.',
    'Rp 8.999.000',
    'https://images.unsplash.com/photo-1621259182978-fbf93132d53d?w=400',
    8,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Workstation RTX 4000 Ada',
    'Intel Xeon W-2245, RTX 4000 Ada 20GB, 64GB ECC RAM, 2TB NVMe. Professional workstation.',
    'Rp 68.900.000',
    'https://images.unsplash.com/photo-1591799265444-d66432b91588?w=400',
    9,
    true
),

-- 4. Monitors
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'LG UltraGear 27" 240Hz',
    '27 inch QHD IPS, 240Hz, 1ms, G-Sync Compatible. Perfect gaming monitor dengan color accuracy.',
    'Rp 4.799.000',
    'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400',
    10,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Samsung Odyssey G9 49"',
    '49" Dual QHD curved, 240Hz, 1ms. Ultra-wide gaming monitor untuk immersive experience.',
    'Rp 18.999.000',
    'https://images.unsplash.com/photo-1585792180666-f7347c490ee2?w=400',
    11,
    true
),

-- 5. Peripherals
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Logitech G Pro X Superlight 2',
    'Wireless gaming mouse 60g, sensor HERO 2, battery 95 jam. Tournament-grade precision.',
    'Rp 2.299.000',
    'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400',
    12,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Keychron Q1 Pro',
    'Mechanical keyboard QMK/VIA, hot-swappable, wireless. Customizable untuk enthusiast.',
    'Rp 2.899.000',
    'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400',
    13,
    true
),
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'SteelSeries Arctis Nova Pro',
    'Premium gaming headset dengan Active Noise Cancellation. Multi-platform compatibility.',
    'Rp 4.999.000',
    'https://images.unsplash.com/photo-1545127398-14699f92334b?w=400',
    14,
    true
),

-- 6. Storage
(
    (SELECT id FROM companies WHERE company_code = 'techstore-001'),
    'Samsung 990 Pro 2TB NVMe',
    'PCIe 4.0 SSD dengan read 7,450MB/s. Flagship SSD untuk maximum performance.',
    'Rp 3.299.000',
    'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400',
    15,
    true
);

-- =============================================
-- Verification
-- =============================================
SELECT 
    COUNT(*) as total_products,
    company_code
FROM offerings o
JOIN companies c ON o.company_id = c.id
WHERE c.company_code = 'techstore-001'
GROUP BY company_code;

SELECT 
    title,
    price_label,
    display_order
FROM offerings
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order;

-- =============================================
-- Test Pagination
-- =============================================
-- Page 1 (6 items)
SELECT title, price_label 
FROM offerings 
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order 
LIMIT 6 OFFSET 0;

-- Page 2 (6 items)
SELECT title, price_label 
FROM offerings 
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order 
LIMIT 6 OFFSET 6;

-- Page 3 (3 items)
SELECT title, price_label 
FROM offerings 
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order 
LIMIT 6 OFFSET 12;
