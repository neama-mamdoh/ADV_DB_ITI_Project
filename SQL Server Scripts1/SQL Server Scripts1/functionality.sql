
create function FN_Login (@Uname nvarchar(50),@Upass varchar(500))
returns nvarchar(50)
as
begin
	if exists (select username from Accounts where username=@Uname)
	begin
		Declare @pass varchar(500) 
		select @pass= convert(varchar(200),DECRYPTBYPASSPHRASE('Pwd',pass)) from Accounts where username=@Uname
		if @pass=@Upass
		begin
			return @Uname;
		end
	end
		return 'invalid user name or password';
end

--try to login(must run together)
declare @username nvarchar(50);
select @username= dbo.FN_Login ('adham','pass12343')
select @username