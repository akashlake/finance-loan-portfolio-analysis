select * from finance_1 f1
	inner join finance_2 f2 
	on f1.id = f2.id;

-- kpi1
select 
	year(issue_date) as loan_issue_year,
    sum(loan_amnt) as total_loan
from finance_1 
group by year(issue_date)
order by total_loan;

-- kpi2 
select 
	f1.grade,
    f1.sub_grade,
    sum(f2.revol_bal) as total_revol_bal 
    from finance_1 f1
    inner join finance_2 f2 on 
    f1.id = f2.id 
    group by f1.grade, f1.sub_grade
    order by f1.grade, f1.sub_grade;

-- kpi3
select distinct verification_status from finance_1;
    
select
	f1.verification_status,
    sum(f2.total_pymnt) as total_payment
    from finance_1 f1
    inner join finance_2 f2 
    on f1.id = f2.id 
    group by f1.verification_status
    order by total_payment desc;
    
select * from finance_1;

-- kpi4
select 
	addr_state,
    monthname(issue_date) as month,
    loan_status,
    count(*) as total_loans
from finance_1 
	group by
		addr_state,
        month(issue_date),
        monthname(issue_date),
        loan_status
	order by
		addr_state,
        month(issue_date);
      
-- kpi5
select 
	f1.home_ownership,
    count(*) as total_loans,
    max(f2.last_pymnt_d) as latest_payments,
    min(f2.last_pymnt_d) as earliest_payments
from finance_1 f1
inner join finance_2 f2 
on f1.id = f2.id 
group by
	f1.home_ownership
order by
	max(f2.last_pymnt_d);
        
