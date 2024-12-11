COMMENT ON TABLE person_discounts IS 'Таблица, содержащая информацию о скидках для пользователей на пиццерии';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор пользователя';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах';