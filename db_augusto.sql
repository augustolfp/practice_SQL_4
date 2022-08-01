CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	"email" TEXT(255) NOT NULL UNIQUE,
	"password" TEXT(255) NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"price" integer NOT NULL,
	"categoryId" bigint NOT NULL,
	"size" TEXT NOT NULL,
	"stock" integer NOT NULL,
	"mainImageId" bigint NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.images" (
	"id" serial NOT NULL,
	"productId" bigint NOT NULL,
	"link" TEXT NOT NULL,
	CONSTRAINT "images_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.transactions" (
	"id" serial NOT NULL,
	"userId" bigint NOT NULL,
	"statusId" bigint NOT NULL UNIQUE,
	"adressId" bigint NOT NULL,
	CONSTRAINT "transactions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart" (
	"id" serial NOT NULL,
	"productId" bigint NOT NULL,
	"quantity" bigint NOT NULL,
	"transactionId" bigint NOT NULL,
	CONSTRAINT "cart_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adresses" (
	"id" serial NOT NULL,
	"description" serial NOT NULL,
	"userId" bigint NOT NULL,
	CONSTRAINT "adresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.status" (
	"id" serial NOT NULL,
	"creationDate" DATE NOT NULL,
	"paidDate" DATE,
	"deliverDate" DATE,
	"cancelDate" DATE,
	CONSTRAINT "status_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("mainImageId") REFERENCES "images"("id");


ALTER TABLE "images" ADD CONSTRAINT "images_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk1" FOREIGN KEY ("statusId") REFERENCES "status"("id");
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk2" FOREIGN KEY ("adressId") REFERENCES "adresses"("id");

ALTER TABLE "cart" ADD CONSTRAINT "cart_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "cart" ADD CONSTRAINT "cart_fk1" FOREIGN KEY ("transactionId") REFERENCES "transactions"("id");

ALTER TABLE "adresses" ADD CONSTRAINT "adresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "status" ADD CONSTRAINT "status_fk0" FOREIGN KEY ("id") REFERENCES "transactions"("statusId");









