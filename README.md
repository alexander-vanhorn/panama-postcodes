# panama-postcodes
This is a postcodes prototype for the Panama's National Post Office use case based in SQL. It's a early development. 
Do not expect anything operational or pretty much elaborated. 
This began as a hobby in the early days of the pandemic and I just share this with educational purposes.

In this repo you'll find a joint of queries, which all of them are in disorder. I have pending to write the comments describing every step.
The main purpose of this thing is concatanate using triggers and every time a new province, district, corregimiento and others items are registered. 
A new postcode will be generated and stored in the db.

For now, you have available a .xlsx file where you can find all political-administrative divisions (Provinces, Districts and "Corregimientos") of Panama. 
Every single item is IDed with a number or a letter, it's posible that some numbers are displayed as letters because they were converted into hex or base-32.

Please take in consideration the National Assembly is constantly creating new political-administrative divisions. 
Some of the bills that support the creation of these news districts and corregimientos, are already sanctioned by the president.
The information shown in that file corresponds to January 2021.
In consequence, the list of Provinces, Districts and Corregimientos is already outdated.
These acts will become effective in July 2024 when new local authorities take their offices.

-----------------------------------------------------------------------------------------------------
Este es un prototipo de códigos postales para el caso de uso de Correos Panamá, basado en SQL. Es un desarrollo temprano.
No espere nada operativo o bastante elaborado.
Esto comenzó como un pasatiempo en los primeros días de la pandemia y solo lo comparto con fines educativos.

En este repositorio encontrará un conjunto de consultas, todas ellas desordenadas. Tengo pendiente escribir los comentarios describiendo cada paso.
El objetivo principal de esta cosa es concatenar usando disparadores y cada vez que se registre una nueva provincia, distrito, corregimiento y otros elementos.
Se generará un nuevo código postal y se almacenará en la base de datos.

Por ahora tiene disponible un archivo .xlsx donde podrá encontrar todas las divisiones político-administrativas (Provincias, Distritos y "Corregimientos") de Panamá.
Cada elemento se identifica con un número o una letra, es posible que algunos números se muestren como letras porque están en hexadecimal o base-32.

Tenga en cuenta que la Asamblea Nacional está constantemente creando nuevas divisiones político-administrativas.
Algunos de los proyectos de ley que apoyan la creación de estos nuevos distritos y corregimientos, ya están sancionados por el presidente.
La información que se muestra en dicho archivo corresponde a enero de 2021.
En consecuencia, la lista de Provincias, Distritos y Corregimientos ya está desactualizada. 
Requirirá ser actualizada más adelante pero desconozco cuando o que tan pronto sea eso, porque aún siguen en discusión proyectos de ley para la creación de nuevos distritos y corregimientos.
Las leyes que avalan la creación de estos distritos y corregimientos están vigentes, pero recordemos que necesitan de personal, presupuesto y principalmente de la autoridad representativa que no ha sido escogida aún; no será hasta 2024 cuando las nuevas autoridades locales sean electas y tomen posesión de sus cargos.
