# ⚠️ Fix: Google Maps & File Protocol Error

## 🔴 Error yang Muncul:

```
Unsafe attempt to load URL file:///C://My/Project/Internal/Engine/frontend/index-futuristic.html#home 
from frame with URL file:///C://My/Project/Internal/Engine/frontend/index-futuristic.html#home. 
'file:' URLs are treated as unique security origins.
```

## 🤔 Kenapa Terjadi?

**Problem:** Anda membuka file HTML dengan **double-click** atau via `file://` protocol.

**Impact:**
- ❌ Google Maps iframe **tidak bisa load**
- ❌ Beberapa fitur JavaScript **tidak bisa jalan**
- ❌ CORS policy **blocking requests**

**Alasan:** Browser menganggap `file://` protocol sebagai **security risk** dan block iframe dari domain lain (seperti Google Maps).

---

## ✅ Solusi: Gunakan Local Web Server

### **Option 1: Python HTTP Server** (RECOMMENDED - Paling Mudah)

#### **Untuk Python 3.x:**
```powershell
# Buka PowerShell/Terminal
# Navigate ke folder frontend
cd "C:\My\Project\Internal\Engine\frontend"

# Start server
python -m http.server 8000

# Atau jika python command tidak ada, coba:
python3 -m http.server 8000

# Atau di Windows kadang:
py -m http.server 8000
```

**Output:**
```
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
```

**Buka di browser:**
```
http://localhost:8000/index-futuristic.html
```

#### **Untuk Python 2.x (old):**
```powershell
python -m SimpleHTTPServer 8000
```

**✅ Sekarang Google Maps akan berfungsi!**

---

### **Option 2: VS Code Live Server Extension**

#### **Steps:**

1. **Install Extension:**
   - Buka VS Code
   - Pergi ke Extensions (Ctrl+Shift+X)
   - Search: "Live Server"
   - Install extension dari **Ritwick Dey**

2. **Start Server:**
   - Buka file `index-futuristic.html` di VS Code
   - Klik kanan di editor
   - Pilih **"Open with Live Server"**
   - Atau klik tombol **"Go Live"** di status bar (kanan bawah)

3. **Auto-open browser:**
   - Browser akan otomatis buka di `http://127.0.0.1:5500/index-futuristic.html`

**Benefits:**
- ✅ **Auto-reload** saat save file
- ✅ **Live preview** saat coding
- ✅ **No terminal needed**

---

### **Option 3: Node.js HTTP Server**

#### **Install (sekali saja):**
```powershell
npm install -g http-server
```

#### **Run:**
```powershell
cd "C:\My\Project\Internal\Engine\frontend"
http-server -p 8000
```

**Buka:**
```
http://localhost:8000/index-futuristic.html
```

---

### **Option 4: PHP Built-in Server** (jika ada PHP)

```powershell
cd "C:\My\Project\Internal\Engine\frontend"
php -S localhost:8000
```

**Buka:**
```
http://localhost:8000/index-futuristic.html
```

---

## 🎯 Comparison

| Method | Pros | Cons | Best For |
|--------|------|------|----------|
| **Python HTTP Server** | ✅ No install (Python built-in)<br>✅ Simple<br>✅ Cross-platform | ⚠️ No auto-reload | Quick testing |
| **VS Code Live Server** | ✅ Auto-reload<br>✅ GUI friendly<br>✅ Developer-friendly | ⚠️ Need VS Code<br>⚠️ Extension install | Development |
| **Node.js HTTP Server** | ✅ Fast<br>✅ Customizable | ⚠️ Need npm install | Advanced users |
| **PHP Server** | ✅ Simple if PHP installed | ⚠️ Need PHP | PHP developers |

---

## 🔍 Verifikasi Berhasil

### **Check Console:**

Buka browser console (F12 → Console tab):

**❌ Jika masih `file://` protocol:**
```
⚠️ PERINGATAN: Website dibuka via file:// protocol
📍 Google Maps dan beberapa fitur mungkin tidak berfungsi
✅ SOLUSI: Gunakan local web server
```

**✅ Jika sudah pakai HTTP server:**
Console bersih, tidak ada warning `file://` protocol.

### **Check Google Maps:**

- ✅ Peta muncul dengan benar
- ✅ Bisa di-zoom, drag
- ✅ Bisa klik untuk buka di Google Maps app
- ✅ No security errors di console

---

## 🚀 Production Deployment

Untuk production (bukan localhost), deploy ke:

### **Option A: Netlify** (RECOMMENDED - Free)

1. Buka https://netlify.com
2. Drag & drop folder `frontend`
3. Done! Get URL: `https://yoursite.netlify.app`

### **Option B: GitHub Pages**

1. Push ke GitHub repository
2. Enable GitHub Pages di Settings
3. URL: `https://username.github.io/repo-name`

### **Option C: Vercel**

1. Install Vercel CLI: `npm i -g vercel`
2. Run: `vercel` di folder frontend
3. Follow prompts
4. Get URL: `https://yoursite.vercel.app`

### **Option D: Shared Hosting** (cPanel, etc)

1. Upload via FTP/File Manager
2. Extract files di `public_html`
3. Access via your domain

---

## 📝 Notes

**Development (local testing):**
- ✅ Use `http://localhost:8000` 
- ✅ Google Maps works
- ✅ All JavaScript works
- ✅ Fast iteration

**Production (live website):**
- ✅ Use HTTPS (secure)
- ✅ Custom domain
- ✅ CDN for fast loading
- ✅ SEO-friendly URLs

---

## 💡 Quick Commands Cheat Sheet

```powershell
# Navigate to folder
cd "C:\My\Project\Internal\Engine\frontend"

# Python 3 (Windows/Mac/Linux)
python -m http.server 8000

# Check if server running
# Open browser: http://localhost:8000/index-futuristic.html

# Stop server
# Press Ctrl+C in terminal

# Change port (if 8000 is busy)
python -m http.server 3000  # or any port
```

---

## ✅ Checklist

- [ ] Install Python (jika belum ada)
- [ ] Open PowerShell/Terminal
- [ ] Navigate to frontend folder
- [ ] Run: `python -m http.server 8000`
- [ ] Open browser: `http://localhost:8000/index-futuristic.html`
- [ ] Check console - no `file://` warning ✅
- [ ] Google Maps loading correctly ✅
- [ ] All features working ✅

---

## ❓ Troubleshooting

**Q: Python tidak dikenali?**
A: Install Python dari https://python.org atau gunakan VS Code Live Server

**Q: Port 8000 sudah dipakai?**
A: Ganti port: `python -m http.server 3000` atau port lain

**Q: Masih error setelah pakai localhost?**
A: Clear browser cache (Ctrl+Shift+Delete) dan refresh (Ctrl+F5)

**Q: Google Maps tetap tidak muncul?**
A: Check embed_url di database, pastikan URL valid dan dimulai dengan `https://www.google.com/maps/embed`

---

**🎉 Setelah pakai local server, semua fitur akan berfungsi normal!**

Untuk development sehari-hari, **strongly recommended** pakai **VS Code Live Server** untuk kemudahan auto-reload.
