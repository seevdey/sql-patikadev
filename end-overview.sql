--1) film tablosundan 'K' karakteri ile başlayan en uzun ve replacement_cost u en düşük 4 filmi sıralayınız.
SELECT  title, length, replacement_cost FROM film
WHERE title LIKE 'K%' 
ORDER BY length DESC, replacement_cost ASC
LIMIT 4;

--2) film tablosunda içerisinden en fazla sayıda film bulunduran rating kategorisi hangisidir?
SELECT rating, COUNT(*) FROM film
GROUP BY rating
ORDER BY COUNT(*) DESC
LIMIT 1;

--3) customer tablosunda en çok alışveriş yapan müşterinin adı nedir?
SELECT customer.first_name, SUM(amount) FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, payment.customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;
/*
SELECT customer.first_name, COUNT(payment.customer_id) FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY first_name
ORDER BY COUNT(payment.customer_id) DESC
LIMIT 1;*/

--4) category tablosundan kategori isimlerini ve kategori başına düşen film sayılarını sıralayınız.
SELECT category.name, COUNT(film_category.category_id) FROM category
INNER JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY COUNT(*) DESC;

--5) film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%e%e%e%e%';
