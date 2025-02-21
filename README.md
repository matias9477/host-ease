# **Host-Ease**

## **🏡 About Host-Ease**

Host-Ease is a web application designed to streamline the management of rental properties, ensuring smooth coordination between **property owners** and **cleaners**. The platform allows owners to manage bookings, track check-ins and check-outs, and schedule cleaning services efficiently.

## **🚀 Features**

- **Property Owners:** Manage apartments, track bookings, and schedule cleanings.
- **Cleaners:** View assigned cleaning tasks and mark them as completed.
- **Automated Notifications:** Email reminders for upcoming cleanings.
- **Role-Based Access:** Secure login for both property owners and cleaners.

---

## **🗃️ Database Schema**

The application is powered by **PostgreSQL** with the following tables:

### **1️⃣ Users (`users`)**

| Column     | Type     | Description                 |
| ---------- | -------- | --------------------------- |
| `id`       | INT (PK) | Unique user identifier      |
| `name`     | TEXT     | User's full name            |
| `email`    | TEXT     | Unique email for login      |
| `password` | TEXT     | Hashed password             |
| `role`     | TEXT     | Role (`owner` or `cleaner`) |

### **2️⃣ Apartments (`apartments`)**

| Column        | Type     | Description                 |
| ------------- | -------- | --------------------------- |
| `id`          | INT (PK) | Unique apartment identifier |
| `owner_id`    | INT (FK) | Owner of the apartment      |
| `address`     | TEXT     | Apartment address           |
| `custom_name` | TEXT     | Custom name for the listing |
| `rooms`       | INT      | Number of rooms             |
| `max_guests`  | INT      | Maximum guest capacity      |

### **3️⃣ Stays (`stays` - Guest Bookings)**

| Column                   | Type      | Description                      |
| ------------------------ | --------- | -------------------------------- |
| `id`                     | INT (PK)  | Unique stay identifier           |
| `apartment_id`           | INT (FK)  | Linked apartment                 |
| `guest_name`             | TEXT      | Guest's full name                |
| `guest_phone`            | TEXT      | Contact phone number             |
| `checkin_date`           | TIMESTAMP | Scheduled check-in date/time     |
| `checkout_date`          | TIMESTAMP | Scheduled check-out date/time    |
| `requested_checkin_time` | TIMESTAMP | Custom check-in request by guest |

### **4️⃣ Cleanings (`cleanings` - Cleaning Tasks)**

| Column           | Type      | Description                       |
| ---------------- | --------- | --------------------------------- |
| `id`             | INT (PK)  | Unique cleaning task identifier   |
| `apartment_id`   | INT (FK)  | Associated apartment              |
| `cleaner_id`     | INT (FK)  | Assigned cleaner                  |
| `scheduled_time` | TIMESTAMP | Expected cleaning start time      |
| `completed`      | BOOLEAN   | Whether the cleaning is completed |
| `hourly_rate`    | INT       | Payment per hour for the cleaner  |
| `paid`           | BOOLEAN   | Payment status                    |

### **5️⃣ Categories (`categories` - Apartment Types)**

| Column        | Type     | Description                    |
| ------------- | -------- | ------------------------------ |
| `id`          | INT (PK) | Unique category identifier     |
| `name`        | TEXT     | Category name (e.g., "Luxury") |
| `description` | TEXT     | Description of the category    |

### **6️⃣ Amenities (`amenities` - Available Features)**

| Column        | Type     | Description                 |
| ------------- | -------- | --------------------------- |
| `id`          | INT (PK) | Unique amenity identifier   |
| `name`        | TEXT     | Amenity name (e.g., "WiFi") |
| `description` | TEXT     | Details about the amenity   |

### **7️⃣ Category-Amenity Relationship (`category_amenities` - Linking Categories to Amenities)**

| Column        | Type     | Description         |
| ------------- | -------- | ------------------- |
| `id`          | INT (PK) | Unique identifier   |
| `category_id` | INT (FK) | Associated category |
| `amenity_id`  | INT (FK) | Linked amenity      |

---

## **⚙️ Installation & Setup**

### **Backend Setup**

```sh
cd backend
npm install
cp .env.example .env  # Update database credentials
npx drizzle-kit generate
npx drizzle-kit push
npm run dev
```

### **Frontend Setup**

```sh
cd frontend
npm install
npm run dev
```

### **Database Setup (Using Docker)**

```sh
cd infra
docker-compose up -d
```

---

## **📌 Roadmap & Future Features**

🔹 Dashboard for tracking property performance.  
🔹 Admin panel for managing users and permissions.  
🔹 Payment system for cleaners and automated invoicing.  
🔹 Mobile app for on-the-go property management.

---

## **🛠️ Tech Stack**

- **Frontend:** React (Next.js), TailwindCSS
- **Backend:** Node.js, GraphQL, Drizzle ORM
- **Database:** PostgreSQL
- **Infrastructure:** Docker (optional)

---

## **📩 Contributing**

We welcome contributions! Feel free to submit **pull requests** or create **issues** for feature requests or bug reports.

---

## **📞 Contact**

For inquiries, reach out to our team at:  
📧 **support@host-ease.com**  
🌍 **Website:** [www.host-ease.com](https://www.host-ease.com)

🚀 **Happy Hosting!**
