{{ config(
    materialized='table',
    database='gangdeladata789',
    schema='modelisation'
) }}

select
    rooms.booking_reference,
    rooms.booked_at,
    rooms.start_date,
    rooms.end_date,
    rooms.booking_status,
    rooms.room_fee as booking_price,
    hotels.commission_percentage,
    rooms.organisation_id,
    rooms.organisation_name,
    rooms.user_id,
    rooms.hotel_id,
    hotels.name as hotel_name,
    rooms.id as hotel_room_id,
    rooms.payment_done_at
from {{ source("modelisation_sources", "rooms") }} as rooms
left join
    {{ source("modelisation_sources", "hotels") }} as hotels
    on hotels.id = rooms.hotel_id
