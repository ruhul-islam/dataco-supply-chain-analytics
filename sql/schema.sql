-- ─────────────────────────────────────────────────────────────────────────────
-- DataCo Supply Chain Star Schema
-- Business Problem: What is driving late deliveries across the global
-- supply chain and where should operations leadership act first?
-- Author: Ruhul Islam
-- ─────────────────────────────────────────────────────────────────────────────

-- ── 1. DIM_CUSTOMER ──────────────────────────────────────────────────────────
CREATE OR REPLACE TABLE dim_customer (
    customer_id         INTEGER PRIMARY KEY,
    first_name          VARCHAR,
    last_name           VARCHAR,
    customer_segment    VARCHAR,
    customer_city       VARCHAR,
    customer_state      VARCHAR,
    customer_country    VARCHAR,
    customer_street     VARCHAR,
    customer_zipcode    VARCHAR
);

-- ── 2. DIM_CATEGORY ───────────────────────────────────────────────────────────
CREATE OR REPLACE TABLE dim_category (
    category_id         INTEGER PRIMARY KEY,
    category_name       VARCHAR
);

-- ── 3. DIM_DEPARTMENT ─────────────────────────────────────────────────────────
CREATE OR REPLACE TABLE dim_department (
    department_id       INTEGER PRIMARY KEY,
    department_name     VARCHAR
);

-- ── 4. DIM_PRODUCT ────────────────────────────────────────────────────────────
CREATE OR REPLACE TABLE dim_product (
    product_card_id     INTEGER PRIMARY KEY,
    product_name        VARCHAR,
    product_image       VARCHAR,
    product_price       FLOAT,
    product_status      INTEGER,
    category_id         INTEGER
);

-- ── 5. DIM_LOCATION ───────────────────────────────────────────────────────────
-- No single natural primary key — unique combination of all location fields
CREATE OR REPLACE TABLE dim_location (
    market              VARCHAR,
    order_region        VARCHAR,
    order_country       VARCHAR,
    order_state         VARCHAR,
    order_city          VARCHAR,
    latitude            FLOAT,
    longitude           FLOAT
);

-- ── 6. FACT_ORDERS ────────────────────────────────────────────────────────────
CREATE OR REPLACE TABLE fact_orders (
    order_item_id               INTEGER PRIMARY KEY,
    order_id                    INTEGER,
    order_customer_id           INTEGER,
    customer_id                 INTEGER,
    product_card_id             INTEGER,
    department_id               INTEGER,
    market                      VARCHAR,
    order_region                VARCHAR,
    order_country               VARCHAR,
    order_state                 VARCHAR,
    order_city                  VARCHAR,
    shipping_mode               VARCHAR,
    order_date                  DATE,
    shipping_date               DATE,
    real_shipping_days          INTEGER,
    scheduled_shipment_days     INTEGER,
    delay_days                  INTEGER,
    late_delivery_risk          INTEGER,
    is_late                     INTEGER,
    delivery_status             VARCHAR,
    order_status                VARCHAR,
    transaction_type            VARCHAR,
    order_item_quantity         INTEGER,
    order_item_discount         FLOAT,
    order_item_discount_rate    FLOAT,
    order_item_product_price    FLOAT,
    order_item_profit_ratio     FLOAT,
    sales                       FLOAT,
    order_item_total            FLOAT,
    order_profit_per_order      FLOAT,
    benefit_per_order           FLOAT,
    sales_per_customer          FLOAT
);