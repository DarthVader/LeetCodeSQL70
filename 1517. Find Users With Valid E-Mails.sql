
/* Write your T-SQL query statement below */

select user_id, name, mail from Users
cross apply (
    select case 
        when mail LIKE '%@%@%' then 0
        when mail like '%[%,=,#,^,&,*,(,),+,=,!,`,~,{,},$]%' then 0
        when right(mail, 13) != '@leetcode.com' then 0
        when left(mail, 1) not like '[A-z]' then 0
        else 1
      end chk
) x
where chk = 1
