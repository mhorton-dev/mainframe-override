/*
question 1.  get username of people who posted about EmptyStack.  It looks like the author column
holds the usernames of the posters.
 */
SELECT
    username
FROM
    forum_accounts fa
    INNER JOIN forum_posts fp ON fp.author = fa.username
WHERE
    fp.content LIKE '%EmptyStack%';

/*
Get the last name of the person associated with that username in forum_accounts.
 */
SELECT
    last_name
FROM
    forum_accounts fa
    INNER JOIN forum_posts fp ON fp.author = fa.username
WHERE
    fp.content LIKE '%EmptyStack%';

/*
Find all other accounts with the same last name.
 */
SELECT
    *
FROM
    forum_accounts
WHERE
    last_name = 'Steele';

/*Find all accounts in emptystack_accounts with the same last name.*/
SELECT
    *
FROM
    emptystack_accounts
WHERE
    last_name = 'Steele';

/*There will only be one EmptyStack employee with a forum account.
Use their credentials to access node mainframe, which will output
a new sql file for you to run.
lance-main-11
password789 
 */
SELECT
    *
FROM
    emptystack_accounts
WHERE
    username = 'lance-main-11'
/*
              List of relations
 Schema |        Name         | Type  | Owner
--------+---------------------+-------+-------
 public | emptystack_accounts | table | mhort
 public | emptystack_messages | table | mhort
 public | emptystack_projects | table | mhort
 public | forum_accounts      | table | mhort
 public | forum_posts         | table | mhort
 */

SELECT em.*, ea.* FROM emptystack_messages em INNER JOIN emptystack_accounts ea ON em.from = ea.username;
/*
  id   |     from     |       to       |   subject    |                            body                            |   username   |    password    | first_name | last_name
-------+--------------+----------------+--------------+------------------------------------------------------------+--------------+----------------+------------+-----------
 LidWj | your-boss-99 | triple-cart-38 | Project TAXI | Deploy Project TAXI by end of week. We need this out ASAP. | your-boss-99 | notagaincarter | Skylar     | Singer
 */

 mainframe_override=# SELECT * FROM emptystack_projects WHERE code = 'TAXI';
 /*
    id    | code
----------+------
 DczE0v2b | TAXI
(1 row)

mainframe_override=# \q
PS C:\Users\mhort\OneDrive\Desktop\Coursework\2507-FTB-ET-WEB-FT\unit6.36\mainframe-override> node mainframe -stop
WARNING: admin access required. Unauthorized access will be logged.
Username: your-boss-99
Password: notagaincarter
Welcome, your-boss-99.
Project ID: DczE0v2b
Initiating project shutdown sequence...
5...
4...
3...
2...
1...
Project shutdown complete.
PS C:\Users\mhort\OneDrive\Desktop\Coursework\2507-FTB-ET-WEB-FT\unit6.36\mainframe-override>
*/