SELECT 
	a.`inv_id` AS `id`,
	a.`inv_name` AS `name`,
	a.`inv_number` AS `number`,
	a.`inv_type_id` AS type_id,
	c.`type_name` AS `type`,
	a.`inv_category_id` AS `category_id`,
	b.`category_name` AS `category`,
	a.`inv_date_procurement` AS `date_procurement`,
	(SELECT COUNT(aa.`inv_id`) FROM inv_inventory aa WHERE aa.`inv_type_id` = a.`inv_type_id`) AS count_total
	(SELECT COUNT(aa.`inv_id`) FROM inv_inventory aa WHERE aa.`inv_type_id` = a.`inv_type_id`) AS count_total			
FROM inv_inventory a
JOIN inv_ref_category b ON b.`category_id` = a.`inv_category_id`
JOIN inv_ref_type c ON c.`type_id` = a.`inv_type_id`

WHERE
	1 = 1

GROUP BY a.`inv_type_id`
