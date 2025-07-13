-- {{ modules.custom_package.salutation("users") }}
-- {{ modules.custom_module.baz() }}

select user_id
from {{ ref("users") }}
