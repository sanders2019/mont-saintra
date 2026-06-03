# Mont-Saintra on Railway - Deployment Guide
## Step-by-Step Deployment Instructions

---

## 🎯 PRE-DEPLOYMENT CHECKLIST

### Step 1: Initialize Git Repository
```bash
cd /Users/sanderssadin/Desktop/mont-saintra
git init
git add .
git commit -m "Initial Mont-Saintra Fleet Management App commit"
```

### Step 2: Create GitHub Account (if you don't have one)
- Go to **github.com**
- Sign up for free
- Create new repository named "mont-saintra"

### Step 3: Push Code to GitHub
```bash
# Add your GitHub repo (replace YOUR_USERNAME and YOUR_TOKEN)
git remote add origin https://github.com/YOUR_USERNAME/mont-saintra.git
git branch -M main
git push -u origin main
```

---

## 🚀 RAILWAY DEPLOYMENT (5 MINUTES)

### What is Railway?
Railway is a modern hosting platform perfect for deploying Laravel apps. It:
- Auto-detects Laravel
- Includes database
- Free SSL/HTTPS
- GitHub integration
- Only $5/month

### Step 1: Sign Up for Railway
1. Go to **railway.app**
2. Click "Start Project"
3. Sign up with **GitHub** (easiest)
4. Authorize Railway to access your GitHub

### Step 2: Deploy Your App
1. In Railway dashboard, click **"New Project"**
2. Select **"Deploy from GitHub repo"**
3. Authorize GitHub access
4. Select **"mont-saintra"** repository
5. Click **"Deploy"**
6. Railway auto-detects it's a Laravel app
7. **Deployment starts automatically** ✅

### Step 3: Monitor Deployment
- Watch the deployment logs in Railway dashboard
- Wait for "Build successful" message
- Railway shows your live URL when done

**Example URL:** `https://mont-saintra-prod-xxxxx.railway.app`

---

## ⚙️ CONFIGURE ENVIRONMENT VARIABLES

After deployment, Railway shows a "Variables" tab. Add these:

```
APP_ENV=production
APP_DEBUG=false
APP_URL=https://your-railway-url.railway.app
APP_KEY=base64:YOUR_APP_KEY_HERE
DB_CONNECTION=mysql
DB_HOST=[Railway will provide]
DB_PORT=3306
DB_DATABASE=railway
DB_USERNAME=[Railway will provide]
DB_PASSWORD=[Railway will provide]
```

**How to find your APP_KEY:**
```bash
cd /Users/sanderssadin/Desktop/mont-saintra
php artisan key:generate --show
```

---

## 🗄️ SET UP DATABASE

### Step 1: Add MySQL Service in Railway
1. Go to Railway project dashboard
2. Click **"Create New Service"**
3. Select **"MySQL"**
4. Railway auto-connects to your Laravel app

### Step 2: Run Migrations
Once database is connected, run:
```bash
# Via Railway CLI or dashboard
php artisan migrate --force
```

Or via SSH in Railway:
```bash
railway run php artisan migrate --force
```

### Step 3: Seed Database (Optional)
```bash
php artisan db:seed --force
```

---

## 🌐 ADD CUSTOM DOMAIN (Optional)

### Step 1: Buy Domain
- Go to **namecheap.com** or **google.com/domains**
- Search for domain (e.g., `fleetmontsaintra.com`)
- Buy domain ($8-12/year)
- Note your nameservers

### Step 2: Connect Domain to Railway
1. In Railway project settings
2. Go to **"Custom Domain"**
3. Enter your domain: `fleetmontsaintra.com`
4. Railway provides DNS records
5. Update nameservers in Namecheap/Google Domains

### Step 3: Wait for DNS Propagation
- Takes 24-48 hours
- Check with `nslookup fleetmontsaintra.com`
- Once resolved, your app is live on your domain!

---

## 🔑 ADMIN LOGIN SETUP

After deployment:

1. Access your app at: `https://mont-saintra-prod-xxxxx.railway.app`
2. Use database seeded credentials (check database/seeds/)
3. Or create new admin via Railway SSH:
   ```bash
   railway run php artisan tinker
   ```

---

## ✅ POST-DEPLOYMENT CHECKLIST

- [ ] App deployed to Railway
- [ ] Live URL working
- [ ] Database connected
- [ ] Migrations run successfully
- [ ] Can log in to admin panel
- [ ] All features working
- [ ] Domain purchased (optional)
- [ ] Domain pointing to Railway
- [ ] SSL/HTTPS working
- [ ] Backups configured

---

## 🔧 TROUBLESHOOTING

### "Build failed" error?
- Check Laravel version compatibility
- Verify `composer.json` is valid
- Check `storage/` and `bootstrap/cache/` are writable
- View logs in Railway dashboard

### "Database not connecting"?
- Verify MySQL service is created
- Check environment variables in Railway
- Run `php artisan migrate --force` again
- SSH into deployment and test connection

### "White screen of death"?
- Check `storage/logs/laravel.log` in Railway
- Verify `APP_DEBUG=false` is correct
- Run `php artisan cache:clear`
- Run `php artisan config:cache`

### "Domain not working"?
- Wait 24-48 hours for DNS propagation
- Verify nameservers in domain registrar
- Check Railway custom domain settings
- Test with `dig yourdomain.com`

---

## 📝 HELPFUL COMMANDS

```bash
# View app logs
railway logs

# SSH into deployment
railway shell

# Run artisan commands
railway run php artisan migrate

# Restart app
railway restart

# Check deployment status
railway list
```

---

## 💰 COSTS

| Item | Price | Notes |
|------|-------|-------|
| Railway Hosting | $5/month | Includes database |
| Custom Domain | $12/year | Optional (namecheap) |
| SSL/HTTPS | Free | Included |
| Database | Free | Included in $5 |
| **Total** | **$72/year** | Professional app |

---

## 🎉 YOU'RE DONE!

Your Mont-Saintra app is now live online! 

Next steps:
1. Share your live URL
2. Test all features
3. Make code changes locally
4. Push to GitHub
5. Railway auto-deploys your changes

**That's it! 🚀**
