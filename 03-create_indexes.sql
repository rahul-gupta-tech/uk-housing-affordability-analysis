CREATE INDEX IF NOT EXISTS idx_price_paid_date
ON price_paid(date_of_transfer);

CREATE INDEX IF NOT EXISTS idx_price_paid_county
ON price_paid(county);

CREATE INDEX IF NOT EXISTS idx_price_paid_district
ON price_paid(district);

CREATE INDEX IF NOT EXISTS idx_price_paid_property_type
ON price_paid(property_type);

CREATE INDEX IF NOT EXISTS idx_price_paid_postcode
ON price_paid(postcode);