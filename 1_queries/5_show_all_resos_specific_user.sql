/*
When the user is logged in, they will have an option to view all of their
reservations. */

SELECT reservations.*, properties.*, avg(property_reviews.rating) as average_rating
FROM property_reviews
JOIN properties ON properties.id = property_id
JOIN reservations ON reservations.id = reservation_id
WHERE properties.owner_id = 1 AND reservations.end_date < now()::date
GROUP BY reservations.id, properties.id
ORDER BY reservations.start_date
LIMIT 10;
