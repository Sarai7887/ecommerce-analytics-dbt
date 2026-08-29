with
    raw_orders as (select * from `analytics-project-ecommerce.raw_data.raw_orders`),

    deduplicated_orders as (
        select
            order_id,
            customer_id,
            order_date,
            status,
            amount,
            row_number() over (
                partition by order_id order by order_date desc
            ) as row_num
        from raw_orders
    )

select order_id, customer_id, order_date, status, amount
from deduplicated_orders
where row_num = 1 and amount > 0 and status = 'COMPLETED'
