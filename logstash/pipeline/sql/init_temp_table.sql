SELECT stores.*,
       images.saved_name,
       images.location_code,
       images.domain_name,
       addresses.latitude as lat,
       addresses.longitude as lon,
       addresses.main_place as place,
       GROUP_CONCAT(menu.name) as menus,
       GROUP_CONCAT(DISTINCT store_categories.description) as categories,
       MIN(menu.cooking_time) as minimum_cooking_time
FROM cookshoong_shop_prod.stores
         join images on stores.store_image_id = images.image_id
         join addresses on stores.address_id = addresses.address_id
         join menu on stores.store_id = menu.store_id
         join stores_has_categories on stores.store_id = stores_has_categories.store_id
         join store_categories on stores_has_categories.category_code = store_categories.category_code
GROUP BY stores.store_id
