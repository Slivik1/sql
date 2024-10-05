/* �������� SQL-������, ������� ������ ������ ��������� ��������� ������� ��
���������� ������ ����� 150 000 ������ �� ��������� ���. ���������� �������
������ ���� ������������� �� ������, � �������� �������� ��������� � ���
������ ������.*/

SELECT
 c.cat_name,
 SUM(oi.quantity * p.price) AS total_cost
FROM
 orders as o
JOIN order_items as oi ON o.ord_id = oi.ord_id
JOIN products as p ON oi.product_id = p.prod_id
JOIN categories as c ON p.cat_id = c.cat_id
WHERE
 o.ord_status = 'done' and o.ordered_at >= DATEADD(year, -1, GETDATE())
GROUP BY
 c.cat_name
HAVING
 SUM(oi.quantity * p.price) > 150000
ORDER BY
 total_cost;