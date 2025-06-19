# 📦 Stock‑Em: Capstone Inventory Management System

**Stock‑Em** is a full-stack inventory management application built for Texas A&M Capstone projects. It helps professors and admins effectively track inventory, suppliers, students, and orders.

---

## 🚀 Live Demo & Code Quality

- **Live App**: [Stock‑Em on Heroku](https://stockem-0caaa6588e50.herokuapp.com/welcome/index)
- **Demo Link**: [Youtube Demo](https://www.youtube.com/watch?v=aHZVa2nnDgY)

---

## 🎯 Features

- Manage inventory items (add, update, delete)
- Bulk inventory updates using spreadsheets
- Track suppliers and customers via full CRUD
- Create purchase orders (POs) to and from suppliers/customers
- View history of all orders
- User authentication and role-based permissions

---

## ⚙️ Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/tanishq-chopra1/Stock-Em.git
cd Stock-Em
```

### 2. Install dependencies

```bash
bundle install --without production
bundle install
```

### 3. Set up database

```bash
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

### 4. Start the server

```bash
rails server
# Visit http://localhost:3000
```

---

## 🧪 Testing

```bash
bundle install
rails db:test:prepare
bundle exec rspec           # Runs model/unit tests
bundle exec cucumber        # Runs integration/feature tests
```

To view test coverage:

```bash
open coverage/index.html
```

---

## ☁️ Deploying to Heroku (Optional)

```bash
heroku login
heroku create your-app-name
git push heroku master:main
heroku addons:create heroku-postgresql
heroku run rake db:migrate
heroku run rake db:seed
heroku open
```
---

## 📝 License

This project is open source under the **MIT License**.

---