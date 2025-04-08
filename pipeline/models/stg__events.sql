-- {{ modules.custom_package.salutation("events") }}

select event_id, user_id
from {{ ref("events") }}
