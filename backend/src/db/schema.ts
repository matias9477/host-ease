import {
  pgTable,
  serial,
  text,
  integer,
  timestamp,
  boolean,
} from "drizzle-orm/pg-core";

// Users (Owners & Cleaners)
export const users = pgTable("users", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  email: text("email").unique().notNull(),
  password: text("password").notNull(),
  role: text("role").notNull(), // "owner" or "cleaner"
});

// Apartments
export const apartments = pgTable("apartments", {
  id: serial("id").primaryKey(),
  owner_id: integer("owner_id").references(() => users.id),
  address: text("address").notNull(),
  custom_name: text("custom_name"),
  rooms: integer("rooms").notNull(),
  max_guests: integer("max_guests").notNull(),
});

// Stays (Guest Bookings)
export const stays = pgTable("stays", {
  id: serial("id").primaryKey(),
  apartment_id: integer("apartment_id").references(() => apartments.id),
  guest_name: text("guest_name").notNull(),
  guest_phone: text("guest_phone"),
  checkin_date: timestamp("checkin_date").notNull(),
  checkout_date: timestamp("checkout_date").notNull(),
  requested_checkin_time: timestamp("requested_checkin_time"),
});

// Cleanings
export const cleanings = pgTable("cleanings", {
  id: serial("id").primaryKey(),
  apartment_id: integer("apartment_id").references(() => apartments.id),
  cleaner_id: integer("cleaner_id").references(() => users.id),
  scheduled_time: timestamp("scheduled_time").notNull(),
  completed: boolean("completed").default(false),
  hourly_rate: integer("hourly_rate"),
  paid: boolean("paid").default(false),
});
