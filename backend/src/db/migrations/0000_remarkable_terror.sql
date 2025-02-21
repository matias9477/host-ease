CREATE TABLE "apartments" (
	"id" serial PRIMARY KEY NOT NULL,
	"owner_id" integer,
	"address" text NOT NULL,
	"custom_name" text,
	"rooms" integer NOT NULL,
	"max_guests" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "cleanings" (
	"id" serial PRIMARY KEY NOT NULL,
	"apartment_id" integer,
	"cleaner_id" integer,
	"scheduled_time" timestamp NOT NULL,
	"completed" boolean DEFAULT false,
	"hourly_rate" integer,
	"paid" boolean DEFAULT false
);
--> statement-breakpoint
CREATE TABLE "stays" (
	"id" serial PRIMARY KEY NOT NULL,
	"apartment_id" integer,
	"guest_name" text NOT NULL,
	"guest_phone" text,
	"checkin_date" timestamp NOT NULL,
	"checkout_date" timestamp NOT NULL,
	"requested_checkin_time" timestamp
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	"role" text NOT NULL,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
ALTER TABLE "apartments" ADD CONSTRAINT "apartments_owner_id_users_id_fk" FOREIGN KEY ("owner_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "cleanings" ADD CONSTRAINT "cleanings_apartment_id_apartments_id_fk" FOREIGN KEY ("apartment_id") REFERENCES "public"."apartments"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "cleanings" ADD CONSTRAINT "cleanings_cleaner_id_users_id_fk" FOREIGN KEY ("cleaner_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "stays" ADD CONSTRAINT "stays_apartment_id_apartments_id_fk" FOREIGN KEY ("apartment_id") REFERENCES "public"."apartments"("id") ON DELETE no action ON UPDATE no action;