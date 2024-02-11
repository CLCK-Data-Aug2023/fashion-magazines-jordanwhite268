select c.customer_name as Customer,
    printf('$%.2f', (sum((s.price_per_month * s.subscription_length)))) as amount_due
from orders o
inner join subscriptions s on s.subscription_id=o.subscription_id
inner join customers c on c.customer_id=o.customer_id
where o.order_status = 'unpaid'
and s.description = 'Fashion Magazine'
group by Customer