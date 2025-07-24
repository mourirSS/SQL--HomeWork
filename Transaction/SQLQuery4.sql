use Mydatabase;

create table Accounts (
	Id int primary key identity,
	Name nvarchar(30) not null,
	Balance money not null
);

insert into Accounts (Name, Balance) 
values	('John', 1000.00),
		('Mary', 500.00),
		('Alex', 200.00);

create procedure TransferMoney
    @Giver int,
    @Receiver int,
    @Amount money
as
begin
    begin try
        begin transaction;

        declare @CurrentBalance money;

        --получаю баланс отправителя
        select @CurrentBalance = Balance
        from Accounts
        where Id = @Giver;

        --проверяю есть ли деньги и сумма больше 0
        if @CurrentBalance >= @Amount and @Amount > 0
        begin
            --списываю с первого счёта
            update Accounts
            set Balance = Balance - @Amount
            where Id = @Giver;

            --зачисляю на второй счёт
            update Accounts
            set Balance = Balance + @Amount
            where Id = @Receiver;

            commit transaction;
        end
        else
        begin
            --если условия не выполнены то откат
            rollback transaction;
        end
    end try
    begin catch
        rollback transaction;
    end catch
end;

exec TransferMoney @Giver = 1, @Receiver = 2, @Amount = 150.00;
select * from Accounts;
