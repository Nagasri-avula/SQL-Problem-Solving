# Write your MySQL query statement below
select user_id,name,mail from users where mail  COLLATE utf8mb3_bin regexp
 '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$';