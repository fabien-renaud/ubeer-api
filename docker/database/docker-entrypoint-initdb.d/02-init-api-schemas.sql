CREATE SCHEMA ubeer_api;

CREATE OR REPLACE VIEW ubeer_api.beers AS
SELECT id         AS "id",
       name       AS "name",
       abv        AS "abv",
       ibu        AS "ibu",
       created_at AS "createdAt",
       updated_at AS "updatedAt",
       deleted_at AS "deletedAt"
FROM ubeer.beer;

CREATE OR REPLACE VIEW ubeer_api.breweries AS
SELECT id         AS "id",
       name       AS "name",
       address    AS "address",
       contact    AS "contact",
       email      AS "email",
       created_at AS "createdAt",
       updated_at AS "updatedAt",
       deleted_at AS "deletedAt"
FROM ubeer.brewery;

-- CREATE OR REPLACE VIEW ubeer_api.beers AS
-- SELECT beer.id         AS "id",
--        beer.name       AS "name",
--        beer.abv        AS "abv",
--        beer.ibu        AS "ibu",
--        beer.created_at AS "createdAt",
--        beer.updated_at AS "updatedAt",
--        beer.deleted_at AS "deletedAt",
--        JSONB_STRIP_NULLS(
--                JSONB_BUILD_OBJECT(
--                        'id', brewery.id,
--                        'name', brewery.name,
--                        'address', COALESCE(brewery.address),
--                        'contact', brewery.contact,
--                        'email', brewery.email,
--                        'createdAt', beer.created_at,
--                        'updatedAt', beer.updated_at,
--                        'deletedAt', beer.deleted_at
--                    )) AS brewery
-- FROM ubeer.beer,
--      ubeer.brewery
-- WHERE ubeer.beer.brewery__id = ubeer.brewery.id
