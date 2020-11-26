with payments as (

    select * from {{ ref('stg_payments')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),
order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
)
,
final as (

    select
        orders.customer_id,
        orders.order_id,
        orders.order_date,
         coalesce(order_payments.amount, 0) as amount
    from orders
    LEFT JOIN order_payments ON order_payments.order_id= orders.order_id
)

SELECT * FROM final
