alter trigger generar_codigo_bloque
on bloque
for insert 
as

update bloque 
	set pc_bloque =  CONCAT(i.bloque_barrio,i.cod_bloque) from inserted as i 
	inner join barrios as b 
	on i.bloque_barrio = b.pc_barrio
	where 
		i.cod_bloque = bloque.cod_bloque
	



insert into bloque (cod_bloque, bloque_barrio) values	('A','P44 4'),
														('B','P44 4'),
														('C','P44 4'),
														('D','P44 4')

truncate table bloque

select * from bloque

select * from barrios

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