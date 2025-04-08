-- {{ modules.custom_package.salutation("users") }}

select user_id
from {{ ref("users") }}
