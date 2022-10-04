/*
	Código Postales Panameños
	Fase inicial
	Adaptado por: Alexander Vanhorn
*/

create database postcodes

use postcodes

---Tabla Provincias---

create table Provincias (
	cod_provincia char(1)
		constraint pk_cod_provincia primary key,
	nombre_provincia varchar(30)
)

insert into Provincias values	('B','Bocas del Toro'),
								('C','Coclé'),
								('L','Colón'),
								('I', 'Chiriquí'),
								('D','Darién'),
								('H','Herrera'),
								('S','Los Santos'),
								('P','Panamá'),
								('V','Veraguas'),
								('G','Comarca Guna Yala'),
								('E', 'Comarca Embera Wounann'),
								('N','Comarca Ngabe Buglé'),
								('W','Panamá Oeste')

select * from Provincias

create table distritos (
	cod_distrito INT IDENTITY (1,1)
		constraint pk_cod_distrito primary key,
	nom_distrito varchar(30),
	dis_cod_prov char (1)
		constraint fk_dis_cod_prov foreign key (dis_cod_prov)
			references Provincias(cod_provincia)
			on delete cascade
			on update cascade
		constraint ck_dis_cod_prov check( dis_cod_prov like 'B' or
										  dis_cod_prov like 'C' or
										  dis_cod_prov like 'L' or
										  dis_cod_prov like 'I' or
										  dis_cod_prov like 'D' or
										  dis_cod_prov like 'H' or
										  dis_cod_prov like 'S' or
										  dis_cod_prov like 'P' or
										  dis_cod_prov like 'V' or
										  dis_cod_prov like 'G' or
										  dis_cod_prov like 'E' or
										  dis_cod_prov like 'N' or
										  dis_cod_prov like 'W' )
)

insert into distritos (nom_distrito, dis_cod_prov) values	('Balboa','P'),
															('Chepo','P'),
															('Chimán','P'),
															('Panamá','P'),
															('San Miguelito','P'),
															('Taboga','P')


select * from distritos

truncate table distritos

create table corregimientos (
	cod_corr int identity (1,1)
		constraint pk_cod_corr primary key,
	nom_corr varchar(30),
	corr_cod_dist int 
		constraint fk_corr_cod_dist foreign key (corr_cod_dist)
			references distritos(cod_distrito)
			on delete cascade
			on update cascade
		constraint ck_corr_cod_dist check (corr_cod_dist between 1 and 79)
)

insert into corregimientos (nom_corr, corr_cod_dist) values ('24 de Diciembre',4),
															('Alcalde Díaz',4),
															('Ancón',4),
															('Betania',4),
															('Bella Vista',4),
															('Calidonia',4),
															('Caimitillo',4),
															('Chilibre',4),
															('Curundú',4),
															('Don Bosco',4),
															('El Chorrillo',4),
															('Ernesto Córdoba Campos',4),
															('Juan Díaz',4),
															('Las Cumbres',4),
															('Las Garzas',4),
															('Las Mañanitas',4),
															('Pacora',4),
															('Parque Lefevre',4),
															('Pedregal',4),
															('Pueblo Nuevo',4),
															('Río Abajo',4),
															('San Felipe',4),
															('San Francisco',4),
															('San Martín',4),
															('Santa Ana',4),
															('Tocumen',4)

select * from corregimientos

truncate table corregimientos

create table barrios (
	cod_barrio int identity (1,1)
		constraint pk_cod_barrios primary key, 
	nom_barrio varchar (30),
	barr_cod_corr int
		constraint fk_barr_cod_corr foreign key (barr_cod_corr)
			references corregimientos(cod_corr)
				on delete cascade
				on update cascade,
	pc_barrio varchar(10)
		constraint UK_pc_barrio unique
)

insert into barrios (nom_barrio, barr_cod_corr) values  ('Altos de Betania',4),
														('Altos del Chase',4),
														('Betania Centro',4),
														('Club X',4),
														('Condado del Rey',4),
														('Dos Mares',4),
														('Edison Park',4),
														('El Avance',4),
														('El Dorado',4),
														('El Ingenio',4),
														('El Milagro No. 2',4),
														('La Alameda',4),
														('La Gloria',4),
														('La Loceria',4),
														('Las Mercedes',4),
														('Linda Vista',4),
														('Los Angeles',4),
														('Los Libertadores',4),
														('Miraflores',4),
														('Panacasa',4),
														('Pribanco',4),
														('Residencial Colonial',4),
														('Santa Maria',4),
														('Sara Sotillo',4),
														('Tuira y Chucunaque',4),
														('Urb. Industrial',4),
														('Urb. Industrial Orillac',4),
														('Villa Caceres',4),
														('Villa de las Fuentes 1',4),
														('Villa de las Fuentes 2',4),
														('Villa Soberania',4)

select * from barrios

truncate table barrios

alter trigger generar_codigo
on barrios
for insert 
as

declare @concat as varchar(10),
		@cnt int = 1,
		@cnt_total int

declare @pc_barrio as table (cod_provincia char(1), cod_distrito int, cod_corr int, cod_barrio int)

insert into @pc_barrio select p.cod_provincia, d.cod_distrito, c.cod_corr, ROW_NUMBER()OVER(ORDER BY i.cod_barrio) from Provincias as p
	inner join distritos as d on p.cod_provincia = d.dis_cod_prov
	inner join corregimientos as c on d.cod_distrito = c.corr_cod_dist
	inner join inserted as i on c.cod_corr = i.barr_cod_corr
	order by i.cod_barrio asc

--Hasta el insert todo bien. De aquí en adelante se requiere un proceso iterativo (WHILE)--

select @cnt_total = COUNT(*) from @pc_barrio

WHILE @cnt <= @cnt_total
BEGIN
   SELECT @concat = CONCAT(cod_provincia,cod_distrito,cod_corr,' ',cod_barrio) FROM @pc_barrio
		where cod_barrio = @cnt
   update barrios	
		set pc_barrio = @concat
		where cod_barrio = @cnt
   SET @cnt = @cnt + 1;
END;


create table bloque (
	cod_bloque char(1)
		constraint pk_cod_bloques primary key,
	bloque_barrio varchar(10),
	pc_bloque varchar(10)
)

select * from bloque

drop table
----

----

create table categorias(
	cod_categoria char(1)
		constraint pk_cod_categoria primary key
		constraint ck_cod_catgeoria check	(cod_categoria like 'C' or 
											cod_categoria like 'R' or
											cod_categoria like 'E' or
											cod_categoria like 'T' or
											cod_categoria like 'D' or
											cod_categoria like 'N' or
											cod_categoria like 'A' or
											cod_categoria like 'M' or
											cod_categoria like 'I' or
											cod_categoria like 'U' or
											cod_categoria like 'H'),
	nom_categoria varchar (30),
	categ_pc_bloques varchar(10),
	pc_categ varchar(10)
)


/*

Copyright 2021 Alexander Vanhorn

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/




 


