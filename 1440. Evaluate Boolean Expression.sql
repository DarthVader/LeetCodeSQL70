
/* Write your T-SQL query statement below */

select left_operand, operator, right_operand,
    case operator
        when '>' then iif(lvalue > rvalue, 'true', 'false')
        when '<' then iif(lvalue < rvalue, 'true', 'false')
        when '=' then iif(lvalue = rvalue, 'true', 'false')
        else 'false'
    end value
from Expressions e
left join Variables v1 on e.left_operand = v1.name
left join Variables v2 on e.right_operand = v2.name
cross apply (
    select  coalesce(v1.value, v2.value) lvalue, 
            coalesce(v2.value, v1.value) rvalue
) x