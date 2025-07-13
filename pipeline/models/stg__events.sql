-- {{ modules.custom_package.salutation("events") }}
-- {{ modules.another_package.foo.bar() }}

select event_id, user_id
from {{ ref("events") }}
