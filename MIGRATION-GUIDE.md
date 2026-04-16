# 🔄 Schema Migration & Testing Guide

## ✅ Langkah-Langkah Migrasi

### Step 1: Backup Database (IMPORTANT!)

```sql
-- Export data sebelum migration
-- Di Supabase: Table Editor → klik 3 dots → Export to CSV

-- Or backup via SQL:
COPY company_profiles TO '/tmp/company_profiles_backup.csv' CSV HEADER;
COPY offerings TO '/tmp/offerings_backup.csv' CSV HEADER;
```

---

### Step 2: Run Schema Migration

1. **Buka Supabase SQL Editor**
2. **Copy-paste** isi file `schema-migration-seo.sql`
3. **Run Query** (klik Execute atau Ctrl+Enter)
4. **Verify** - Cek output, pastikan tidak ada error

**Expected Output:**
```
ALTER TABLE (success)
ALTER TABLE (success)
...
UPDATE XX rows
CREATE INDEX (success)
```

---

### Step 3: Verify Schema Changes

```sql
-- Check apakah kolom baru sudah ada
SELECT column_name, data_type 
FROM information_schema.columns
WHERE table_name = 'company_profiles'
  AND column_name IN ('tagline', 'description');

-- Expected result:
-- tagline    | text
-- description | text
```

**Jika tidak muncul**, re-run step 2.

---

### Step 4: Update Data dengan SEO Content

```sql
-- Quick test dengan company_code Anda
-- Ganti 'techstore-001' dengan company_code yang sebenarnya

UPDATE company_profiles
SET 
  tagline = 'Toko Komputer Terpercaya #1 di Indonesia',
  description = 'Jual komputer, laptop gaming, PC rakitan dengan harga terbaik. Garansi resmi, cicilan 0%. Trusted by thousands.'
WHERE company_id = (
  SELECT id FROM companies 
  WHERE company_code = 'techstore-001'
);

-- Verify update
SELECT 
  c.company_code,
  cp.display_name,
  cp.tagline,
  cp.description
FROM company_profiles cp
JOIN companies c ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';
```

**Expected:** Harus return 1 row dengan tagline & description terisi.

---

### Step 5: Test Frontend

1. **Refresh** browser (Ctrl+F5 untuk hard refresh)
2. **View Page Source** (Ctrl+U)
3. **Search** untuk `<title>` tag
4. **Verify:** Title harus jadi: `[Display Name] - [Tagline]`

**Example:**
```html
<title>Dunia Computer - Toko Komputer Terpercaya #1 di Indonesia</title>
<meta name="description" content="Jual komputer, laptop gaming...">
```

---

### Step 6: Test SEO Tags

**Facebook Debugger:**
1. Buka https://developers.facebook.com/tools/debug/
2. Paste URL website Anda
3. Klik "Debug"
4. **Verify:** og:title, og:description, og:image muncul

**Google Rich Results:**
1. Buka https://search.google.com/test/rich-results
2. Paste URL atau paste HTML source
3. Klik "Test"
4. **Verify:** Schema.org Organization/Store terdeteksi

---

## 🔍 Troubleshooting

### Problem 1: "Column does not exist: tagline"

**Cause:** Schema migration belum di-run

**Fix:**
```sql
-- Run ini di SQL Editor
ALTER TABLE company_profiles ADD COLUMN tagline TEXT;
ALTER TABLE company_profiles ADD COLUMN description TEXT;
```

---

### Problem 2: "No rows returned" saat query

**Cause:** company_code salah atau data belum ada

**Check company_code:**
```sql
-- List semua companies
SELECT id, company_code FROM companies;

-- Gunakan company_code yang benar
```

---

### Problem 3: company_profiles null di frontend

**Cause:** Relasi belum ter-setup atau data belum ada

**Check:**
```sql
-- Verify relation
SELECT 
  c.id as company_id,
  c.company_code,
  cp.id as profile_id,
  cp.display_name
FROM companies c
LEFT JOIN company_profiles cp ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';
```

**If profile_id is NULL:**
```sql
-- Create profile manually
INSERT INTO company_profiles (company_id, display_name, tagline, description)
VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'My Store',
  'Premium Solutions',
  'Quality products with excellent service'
);
```

---

### Problem 4: Meta tags tidak update di browser

**Cause:** Browser cache

**Fix:**
1. Hard refresh: `Ctrl+F5` (Windows) atau `Cmd+Shift+R` (Mac)
2. Clear browser cache
3. Try incognito/private mode
4. Check View Page Source (bukan Inspect Element)

---

### Problem 5: Offerings tidak muncul

**Cause:** offerings.company_id tidak match

**Check:**
```sql
-- Verify offerings link to correct company
SELECT 
  c.company_code,
  o.id,
  o.title,
  o.company_id
FROM offerings o
JOIN companies c ON o.company_id = c.id
WHERE c.company_code = 'techstore-001';
```

**If empty:**
```sql
-- Add sample offering
INSERT INTO offerings (company_id, title, description, price_label)
VALUES (
  (SELECT id FROM companies WHERE company_code = 'techstore-001'),
  'Sample Product',
  'This is a test product for SEO optimization',
  'Rp 1.000.000'
);
```

---

## ✅ Validation Checklist

### Database Level

- [ ] Column `tagline` exists in company_profiles
- [ ] Column `description` exists in company_profiles
- [ ] Columns `category`, `tags`, `brand` exist in offerings (optional)
- [ ] Data terisi: tagline & description tidak null
- [ ] Offerings ter-link dengan company_id yang benar

**Query untuk check:**
```sql
-- Complete validation
SELECT 
  c.company_code,
  cp.display_name,
  cp.tagline IS NOT NULL as has_tagline,
  cp.description IS NOT NULL as has_description,
  LENGTH(cp.description) as desc_length,
  (SELECT COUNT(*) FROM offerings WHERE company_id = c.id) as total_products
FROM companies c
JOIN company_profiles cp ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';
```

**Expected:**
```
company_code    | techstore-001
display_name    | Dunia Computer
has_tagline     | true
has_description | true
desc_length     | 120-160 (optimal for SEO)
total_products  | > 0
```

---

### Frontend Level

- [ ] Page title format: `[Name] - [Tagline]`
- [ ] Meta description ada dan 120-160 karakter
- [ ] Meta keywords terisi (dari product titles)
- [ ] Open Graph tags complete (og:title, og:description, og:image)
- [ ] JSON-LD schema valid (Organization + Website)
- [ ] Products render correctly
- [ ] Social media footer links muncul

**Check via View Source:**
```html
<!-- Should see: -->
<title>Dunia Computer - Toko Komputer Terpercaya...</title>
<meta name="description" content="Jual komputer...">
<meta property="og:title" content="...">
<script type="application/ld+json" id="schema-organization">
{
  "@context": "https://schema.org",
  "@type": "Store",
  ...
}
</script>
```

---

### SEO Tools Validation

- [ ] **Facebook Debugger** - All OG tags detected
- [ ] **Twitter Card Validator** - Card preview shows correctly
- [ ] **Google Rich Results Test** - Schema detected
- [ ] **PageSpeed Insights** - Score 80+ (green)
- [ ] **Mobile-Friendly Test** - Pass

---

## 🚀 Quick Fix Commands

### Reset to Default (if something wrong)

```sql
-- Set default values
UPDATE company_profiles
SET 
  tagline = 'Premium Solutions for Your Business',
  description = 'Quality products and services with excellent customer support. Trusted by thousands of satisfied customers.'
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');
```

### Re-run SEO Update

```sql
-- Full SEO update (from seo-database-update.sql)
-- Copy section "1. FULL SEO-OPTIMIZED COMPANY PROFILE"
-- Ganti nilai sesuai bisnis Anda
```

### Check Frontend Fetch

Open browser console (F12) dan run:
```javascript
// Test fetch
const { data, error } = await supabaseClient
  .from('companies')
  .select('*, company_profiles(*)')
  .eq('company_code', 'techstore-001')
  .single();

console.log('Profile:', data?.company_profiles);
console.log('Tagline:', data?.company_profiles?.tagline);
console.log('Description:', data?.company_profiles?.description);
```

**Expected:** Semua field terisi, tidak undefined/null.

---

## 📊 Performance Checks

### Database Query Speed

```sql
-- Should run < 100ms
EXPLAIN ANALYZE
SELECT c.*, cp.*
FROM companies c
JOIN company_profiles cp ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';
```

### Frontend Load Time

1. Open DevTools → Network tab
2. Refresh page
3. Check:
   - **Total load time:** < 3 seconds
   - **Supabase API calls:** < 500ms each
   - **DOM Content Loaded:** < 1 second

---

## 📝 Final Notes

**Migration Complete When:**
1. ✅ Schema updated (tagline, description columns exist)
2. ✅ Data populated (values not null)
3. ✅ Frontend renders correctly
4. ✅ SEO meta tags dynamic from database
5. ✅ Validation tools pass (Facebook Debugger, Rich Results)

**Next Steps:**
1. Upload robots.txt & sitemap.xml to domain root
2. Setup Google Search Console
3. Submit sitemap
4. Monitor indexing progress

**Support:**
- Check SEO-GUIDE.md for comprehensive SEO strategy
- Check seo-database-update.sql for query examples
- Test with dummy data first before production

🎉 **Happy SEO Optimizing!**
