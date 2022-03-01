CREATE SCHEMA ubeer;

CREATE TABLE ubeer.beer
(
    id          UUID PRIMARY KEY,
    name        VARCHAR(20) NOT NULL,
    abv         float(1)    NOT NULL,
    CHECK (abv >= 0),
    ibu         SMALLINT    NOT NULL,
    CHECK (ibu > 0),
    CHECK (ibu <= 120),
    brewery__id UUID        NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT now(),
    updated_at  TIMESTAMPTZ DEFAULT now(),
    deleted_at  TIMESTAMPTZ DEFAULT NULL
);

CREATE TABLE ubeer.brewery
(
    id         UUID PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    address    VARCHAR(50),
    contact    VARCHAR(50),
    email      VARCHAR(50),
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now(),
    deleted_at TIMESTAMPTZ DEFAULT NULL
)
