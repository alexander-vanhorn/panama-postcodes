create table categorias(
	cod_categoria char(1)
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

select * from categorias

use postcodes


alter trigger generar_codigo_categoria
on categorias
for insert 
as

update categorias
	set pc_categ = CONCAT(i.categ_pc_bloques,i.cod_categoria) from inserted as i 
		inner join bloque as b on i.categ_pc_bloques = b.pc_bloque
	where i.cod_categoria = categorias.cod_categoria



insert into categorias (cod_categoria, nom_categoria,categ_pc_bloques) values	('C','Casa','P44 4A'),
																				('R','Edificio Residencial','P44 4A')

truncate table categorias

select * from categorias

create view all_info as
select	p.nombre_provincia AS 'PROVINCIA',
		d.nom_distrito AS 'DISTRITO',
		c.nom_corr AS 'CORREGIMIENTO', 
		b.nom_barrio AS 'BARRIO',
		v.cod_bloque as 'BLOQUE/CUADRA',
		t.nom_categoria as 'TIPO DE LUGAR',
		t.pc_categ as 'CÓDIGO POSTAL'
		from Provincias as p
			inner join distritos as d on p.cod_provincia = d.dis_cod_prov
			inner join corregimientos as c on d.cod_distrito = c.corr_cod_dist
			inner join barrios as b on c.cod_corr = b.barr_cod_corr
			inner join bloque as v on b.pc_barrio = v.bloque_barrio
			inner join categorias as t on v.pc_bloque = t.categ_pc_bloques

select * from all_info

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
