use postcodes

alter trigger generar_codigo_bloque
on bloque
for insert 
as

declare @concat as varchar(10),
		@cnt int = 1,
		@cnt_total int
		
declare @barrio table (barrio varchar(10))
insert into @barrio select pc_barrio from barrios

declare @pc_bloques table (cod_bloques char(1), pc_barrio varchar(10))

insert into @pc_bloques select i.cod_bloque,b.pc_barrio  from inserted as i
	inner join barrios as b on b.pc_barrio=i.bloque_barrio

select @cnt_total = count(*) from @pc_bloques

WHILE @cnt <= @cnt_total
BEGIN

	SELECT @concat = CONCAT(pc_barrio,cod_bloques) FROM @pc_bloques 
		where cod_bloques in (select distinct(cod_bloque) from bloque)
	select @concat
    update bloque
		set pc_bloque = @concat
		where cod_bloque in (select distinct(cod_bloque) from bloque)

   SET @cnt = @cnt + 1
END

insert into bloque (cod_bloque, bloque_barrio) values	('A','P44 4'),
														('B','P44 4'),
														('C','P44 4'),
														('D','P44 4')

truncate table bloque

select * from bloque

select * from barrios








