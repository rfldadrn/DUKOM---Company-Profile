# 📚 Additional Sections - Dynamic Content System

Sistem untuk menambahkan section custom ke landing page secara dinamis dari database.

## 🎯 Konsep

**Additional Sections** memungkinkan setiap company menambahkan section yang berbeda-beda tanpa perlu edit frontend. Frontend akan **auto-detect** tipe section dan render dengan style yang sesuai.

## 📋 Section Types yang Didukung

### 1️⃣ **FAQ - Accordion Style**

**Section Key:** `faq`

**Format:**
```json
{
  "items": [
    {
      "question": "Pertanyaan?",
      "answer": "Jawaban yang detail..."
    }
  ]
}
```

**Visual:** Accordion yang bisa dibuka-tutup (interactive)

**Use Case:** Pertanyaan umum, troubleshooting, informasi penting

---

### 2️⃣ **Warranty/Benefits - Card Grid**

**Section Key:** `warranty`, `benefits`, atau custom

**Format:**
```json
{
  "items": [
    {
      "icon": "🛡️",
      "title": "Garansi Resmi",
      "description": "Deskripsi lengkap..."
    }
  ]
}
```

**Visual:** Grid cards dengan hover effect

**Use Case:** Jaminan, keuntungan, benefit untuk customer

---

### 3️⃣ **Features - 4 Column Grid**

**Section Key:** `features`

**Format:**
```json
{
  "items": [
    {
      "icon": "⚡",
      "title": "Feature Name",
      "description": "Feature description..."
    }
  ]
}
```

**Visual:** 4-column responsive grid dengan icon besar

**Use Case:** Fitur produk, keunggulan, why choose us

---

### 4️⃣ **Stats - Number Showcase**

**Section Key:** `stats`

**Format:**
```json
{
  "items": [
    {
      "value": "10K+",
      "title": "Happy Customers",
      "description": "Satisfied clients"
    }
  ]
}
```

**Visual:** Big numbers dengan gradient text

**Use Case:** Statistik, achievements, milestones

---

### 5️⃣ **Generic Items - Auto Layout**

**Section Key:** Apapun (custom)

**Format:** Sama seperti warranty/benefits

**Visual:** Card grid - frontend auto-detect structure

**Use Case:** Untuk section yang tidak masuk kategori di atas

---

### 6️⃣ **Custom HTML**

**Section Key:** Apapun

**Format:**
```json
{
  "html": "<p>Custom HTML content here</p>",
  "text": "Plain text alternative"
}
```

**Visual:** Clean content area

**Use Case:** About us, custom content, announcements

---

## 🎨 Styling System

Semua section menggunakan **futuristic dark theme** yang konsisten:

- ✨ Neon glow effects
- 🎪 Hover animations
- 💫 Scroll reveal
- 🌈 Gradient accents
- 🎯 Responsive grid

## 🔄 Render Logic

Frontend menggunakan **smart detection**:

```
1. Cek section_key
   ├─ "faq" → Render accordion
   ├─ "warranty" → Render card grid
   ├─ "features" → Render feature grid
   ├─ "stats" → Render number showcase
   └─ Other → Detect data structure

2. Cek data structure
   ├─ Has items[] → Render cards
   ├─ Has html/text → Render content
   └─ Unknown → Render JSON preview
```

## 📍 Section Placement

Sections akan muncul di urutan ini:
```
Hero
  ↓
Features (built-in)
  ↓
Products
  ↓
Testimonials
  ↓
[ADDITIONAL SECTIONS] ← Dimasukkan di sini berdasarkan display_order
  ↓
Call-to-Action
  ↓
Footer
```

## 🚀 Cara Menggunakan

### Step 1: Insert ke Database

```sql
INSERT INTO additional_sections (
  company_id, 
  section_key, 
  section_title, 
  content, 
  display_order
) VALUES (
  (SELECT id FROM companies WHERE company_code = 'your-company-code'),
  'faq',                           -- ← Section type
  'Frequently Asked Questions',    -- ← Section title
  '{...}'::jsonb,                  -- ← Content JSON
  1                                -- ← Display order
);
```

### Step 2: Content Structure

Sesuaikan dengan tipe section:

**FAQ:**
```json
{
  "items": [
    {"question": "...", "answer": "..."}
  ]
}
```

**Cards (Warranty/Benefits):**
```json
{
  "items": [
    {"icon": "🛡️", "title": "...", "description": "..."}
  ]
}
```

### Step 3: Refresh Website

Section akan **otomatis muncul** dengan design yang sudah sesuai!

## 💡 Best Practices

### ✅ DO:
- Gunakan `section_key` yang descriptive (`faq`, `warranty`, `benefits`)
- Atur `display_order` untuk urutan yang logis (1, 2, 3...)
- Gunakan emoji untuk icon (🛡️ ⚡ 💎 🎮)
- Maksimal 4-6 items per section untuk readability

### ❌ DON'T:
- Jangan gunakan terlalu banyak sections (max 5-6)
- Jangan taruh HTML unsafe di custom HTML
- Jangan duplicate section_key (gunakan suffix: `features-1`, `features-2`)

## 🎯 Examples untuk Different Industries

### Toko Komputer:
1. FAQ - "Pertanyaan Umum"
2. Warranty - "Garansi & Layanan"
3. Stats - "Dipercaya Ribuan Customer"
4. Services - "Layanan Kami"

### Jasa Web Development:
1. Features - "Why Choose Us"
2. Stats - "Our Track Record"
3. FAQ - "Common Questions"
4. Benefits - "What You Get"

### E-Commerce Fashion:
1. Benefits - "Shopping Benefits"
2. Warranty - "Return Policy"
3. FAQ - "Shipping & Returns"

## 🔧 Troubleshooting

**Section tidak muncul?**
- Cek `display_order` tidak null
- Pastikan `company_id` benar
- Refresh browser dengan Ctrl+F5

**Style tidak sesuai?**
- Pastikan `content` adalah valid JSON
- Cek struktur `items` array
- Lihat browser console untuk errors

**Accordion FAQ tidak bisa dibuka?**
- Ensure JavaScript loaded properly
- Check browser console for errors

## 📊 Database Schema Reference

```sql
additional_sections:
  - id (UUID)
  - company_id (UUID) → references companies
  - section_key (TEXT) → 'faq', 'warranty', dll
  - section_title (TEXT) → "Garansi & Layanan"
  - content (JSONB) → {"items": [...]}
  - display_order (INT) → 1, 2, 3...
  - created_at (TIMESTAMPTZ)
```

## 🎨 Customization

Jika ingin custom style untuk section tertentu, tambahkan di frontend:

```javascript
// Di createAdditionalSection()
else if (section.section_key === 'your-custom-type') {
  innerHTML = `
    <div class="container">
      <!-- Your custom HTML structure -->
    </div>
  `;
}
```

---

**Happy customizing!** 🚀

Setiap company bisa punya sections yang berbeda-beda sesuai kebutuhan bisnis mereka!
