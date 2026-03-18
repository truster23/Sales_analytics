SELECT
            s.date,
            sp.country,
            sp.device,
            p.category,
            p.name as product,
            sum(p.price) as revenue,
            count(o.ga_session_id) as order_cnt
from `DA.order` o
join `DA.session` s
on o.ga_session_id = s.ga_session_id
join `DA.product` p
on o.item_id = p.item_id
join `DA.session_params` sp
on o.ga_session_id = sp.ga_session_id
group by
                s.date,
            sp.country,
            sp.device,
            p.category,
            p.name
