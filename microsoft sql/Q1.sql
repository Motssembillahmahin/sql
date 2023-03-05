USE pubs;

----Task-1----
SELECT * FROM authors WHERE au_lname='White' AND state='KS';

----Task-2----
SELECT title FROM titles WHERE ytd_sales>=3000 AND ytd_sales<=10000
ORDER BY title DESC;


----Task-3----
SELECT type,SUM(price) AS tot_price FROM titles
GROUP BY type
HAVING SUM(price)>30;

select * from titles;
select *from authors;
select *from titleauthor;
----Task-4----
SELECT au_fname+' '+au_lname as 'Author Name',title,royalty 
FROM titleauthor JOIN titles ON titleauthor.title_id=titles.title_id JOIN authors
ON titleauthor.au_id=authors.au_id
WHERE royalty = (SELECT MIN(royalty) FROM titles)


----Task-5----

SELECT au_fname,au_lname,authors.city,pub_name,publishers.city
FROM authors JOIN publishers ON authors.city=publishers.city

