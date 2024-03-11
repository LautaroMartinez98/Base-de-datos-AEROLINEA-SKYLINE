create database AEROLINEAS_SKYLINE

create table PAISES (
id_pais int identity (1,1) not null,
nombre_pais varchar(50),
constraint pk_pais primary key (id_pais)
)

create table PROVINCIAS (
id_provincia int identity (1,1) not null,
nombre_provincia varchar(50),
id_pais int,
constraint pk_provincia primary key (id_provincia),
constraint fk_provincia foreign key (id_pais)
references PAISES (id_pais)
)

create table LOCALIDADES (
id_localidad int identity (1,1) not null,
nombre_localidad varchar(50),
codigo_postal varchar(20),
id_provincia int,
constraint pk_localidad primary key (id_localidad),
constraint fk_localidad foreign key (id_provincia)
references PROVINCIAS (id_provincia)
)

create table BARRIOS (
id_barrio int identity (1,1) not null,
nombre_barrio varchar(50),
id_localidad int,
constraint pk_barrio primary key (id_barrio),
constraint fk_barrio foreign key (id_localidad)
references LOCALIDADES (id_localidad)
)

create table CLIENTES (
id_cliente int identity (1,1) not null,
nombre_cliente varchar(50),
apellido_cliente varchar(50),
telefono_cliente varchar(20),
fecha_nac datetime,
id_barrio int,
constraint pk_cliente primary key (id_cliente),
constraint fk_cliente foreign key (id_barrio)
references BARRIOS (id_barrio)
)

create table TIPOS_DNI (
id_tipo_dni int identity (1,1) not null,
descripcion varchar(20),
constraint pk_tipo_dni primary key (id_tipo_dni)
)

create table OPCIONES_PAGO (
id_opcion_pago int identity(1,1) not null,
opcion_de_pago varchar(20),
constraint pk_opcion_pago primary key (id_opcion_pago)
)

create table FACTURAS (
id_factura int identity (1,1) not null,
fecha datetime,
id_cliente int,
id_pago int,
constraint pk_factura primary key (id_factura),
constraint fk_factura_pago foreign key (id_pago) 
references OPCIONES_PAGO (id_opcion_pago),
constraint fk_factura_cliente foreign key (id_cliente)
references CLIENTES (id_cliente)
)

create table CATEGORIAS_SERVICIOS (
id_categoria int identity (1,1) not null,
categoria varchar (50)
constraint pk_categoria primary key (id_categoria) 
)

create table LUGARES (
id_lugar int identity (1,1) not null,
lugar varchar (50),
constraint pk_lugar primary key (id_lugar)
)

create table DESTINOS (
id_destino int identity (1,1) not null,
id_lugar int,
precio money,
constraint pk_destinos primary key (id_destino),
constraint fk_destinos foreign key (id_lugar)
references LUGARES (id_lugar)
)


create table TIPOS_VUELOS (
id_tipo_vuelo int identity (1,1) not null,
tipo_vuelo varchar (50)
constraint pk_tipo_vuelo primary key (id_tipo_vuelo)
)

create table DETALLES (
id_detalle int identity (1,1) not null,
id_factura int,
precio money,
descuento float,
recargo float,
constraint pk_detalle primary key (id_detalle),
constraint fk_detalle foreign key (id_factura)
references FACTURAS (id_factura)
)

create table RESERVAS (
id_reserva int identity(1,1) not null,
id_cliente int,
cantidad_dias int,
cantidad_escalas int,
constraint pk_reserva primary key (id_reserva),
constraint fk_reserva foreign key (id_cliente)
references CLIENTES (id_cliente)
)

create table PASAJEROS (
id_pasajero int identity (1,1) not null,
id_reserva int ,
nombre varchar(30),
apellido varchar(30),
telefono varchar(20),
e_mail varchar(30),
genero varchar(10),
id_tipo_dni int,
dni int,
constraint pk_pasajero primary key (id_pasajero),
constraint fk_pasajero_reserva foreign key (id_reserva)
references RESERVAS (id_reserva),
constraint fk_pasajero_tipodni foreign key (id_tipo_dni)
references TIPOS_DNI (id_tipo_dni)
)

create table ORIGENES (
id_origen int identity (1,1) not null,
origen varchar(30)
constraint pk_origen primary key (id_origen)
)

create table PASAJES (
id_pasaje int identity (1,1) not null,
id_pasajero int,
id_destino int,
id_tipo_vuelo int,
id_origen int,
id_categoria int,
horario datetime,
fecha_emision datetime,
id_detalle int,
constraint pk_pasaje primary key (id_pasaje),
constraint fk_pasaje_pasajero foreign key (id_pasajero)
references PASAJEROS (id_pasajero),
constraint fk_pasaje_destino foreign key (id_destino)
references DESTINOS (id_destino),
constraint fk_pasaje_tipovuelo foreign key (id_tipo_vuelo)
references TIPOS_VUELOS (id_tipo_vuelo),
constraint fk_pasaje_origen foreign key (id_origen)
references ORIGENES (id_origen),
constraint fk_pasaje_categoria foreign key (id_categoria)
references CATEGORIAS_SERVICIOS (id_categoria),
constraint fk_pasaje_detalle foreign key (id_detalle)
references DETALLES (id_detalle)
)


insert into PAISES(nombre_pais)values('Argentina'),('Brasil'),('Colombia'),('Chile'),('Uruguay'),('Paraguay'),('Mexico')


INSERT INTO PROVINCIAS(nombre_provincia,id_pais) VALUES
('Buenos Aires',1),
('Capital Federal',1),
('Catamarca',1),
('Chaco',1),
('Chubut',1),
('Córdoba',1),
('Corrientes',1),
('Entre Ríos',1),
('Formosa',1),
('Jujuy',1),
('La Pampa',1),
('La Rioja',1),
('Mendoza',1),
('Misiones',1),
('Neuquén',1),
('Río Negro',1),
('Salta',1),
('San Juan',1),
('San Luis',1),
('Santa Cruz',1),
('Santa Fe',1),
('Santiago del Estero',1),
('Tierra del Fuego',1),
('Tucumán',1);

INSERT INTO LOCALIDADES(id_provincia,nombre_localidad,codigo_postal) VALUES
(1, '25 de Mayo','X5430'),
(1, '3 de febrero','X4645'),
(1, 'A. Alsina','X5880'),
(1, 'A. Gonzáles Cháves','X1246'),
(1, 'Aguas Verdes','x5656'),
(1, 'Alberti','X3245'),

(2, 'Almagro','3200'),
(2, 'Balvanera','3300'),
(2, 'Barracas','3355'),
(2, 'Belgrano','3400'),
(2, 'Boca','3450'),

(3, 'Aconquija','X4533'),
(3,'Ancasti','X4530'),
(3, 'Andalgalá','X4535'),
(3, 'Antofagasta','X4540'),
(3, 'Belén','X4564'),

(4, 'Barranqueras','x7985'),
(4, 'Basail','x5000'),
(4, 'Campo Largo','x4789'),
(4, 'Capital','x8567'),
(4, 'Capitán Solari','x2376'),

(5,'Buen Pasto','x4633'),
(5,'Camarones','X4630'),
(5,'Carrenleufú','X4625'),
(5,'Cholila','X4620'),
(5,'Co. Centinela','X4600'),

(6, 'Achiras','x9763'),
(6, 'Adelia Maria','X3346'),
(6, 'Agua de Oro','X5534'),
(6, 'Alcira Gigena','X2378'),
(6, 'Aldea Santa Maria','X9613'),

(7, 'Cruz de Los Milagros','X6030'),
(7, 'Curuzú-Cuatiá','X6332'),
(7, 'Empedrado','X6432'),
(7, 'Esquina','X6420'),
(7, 'Estación Torrent','X6423'),

(8, 'Aldea Asunción','X6570'),
(8, 'Aldea Brasilera','X6595'),
(8, 'Aldea Elgenfeld','X6660'),
(8, 'Aldea Grapschental','X6540'),
(8, 'Aldea Ma. Luisa','X6530'),

(9, 'Clorinda','X4991'),
(9, 'Col. Pastoril','X1667'),
(9, 'Cte. Fontana','X5559'),
(9, 'El Colorado','X1777'),
(9, 'El Espinillo','X2888'),

(10, 'El Piquete','X6674'),
(10, 'El Talar','X6682'),
(10, 'Fraile Pintado','X6695'),
(10, 'Hipólito Yrigoyen','X6600'),
(10, 'Huacalera','X6543'),

(11, 'Ataliva Roca','X6712'),
(11, 'Bernardo Larroude','X6790'),
(11, 'Bernasconi','X6743'),
(11, 'Caleufú','X6780'),
(11, 'Carro Quemado','X6783'),

(12, 'Arauco','X5454'),
(12, 'Capital','X7002'),
(12, 'Castro Barros','X7007'),
(12, 'Chamical','X9001'),
(12, 'Chilecito','X1009'),

(13, 'San Rafael','X6890'),
(13, 'Sta. Rosa','X6874'),
(13, 'Tunuyán','X6859'),
(13, 'Tupungato','X6860'),
(13, 'Villa Nueva','X6871'),

(15, 'Plaza Huincul','X6921'),
(15, 'Plottier','X6924'),
(15, 'Quili Malal','X6900'),
(15, 'Ramón Castro','X6986'),
(15, 'Rincón de Los Sauces','X6936'),

(14,'Caraguatay','X2333'),
(14,'Pto. Rico','X2100'),
(14,'Ruiz de Montoya','X1980'),
(14,'San Ignacio','X3700'),
(14,'San Martín','X3780'),

(16, 'Guardia Mitre','X6964'),
(16, 'Ing. Huergo','X6902'),
(16, 'Ing. Jacobacci','X6907'),
(16, 'Laguna Blanca','X6988'),
(16, 'Lamarque','X6916'),

(17, 'Animaná','X7021'),
(17, 'Cachi','X6757'),
(17, 'Cafayate','X6754'),
(17, 'Campo Quijano','X6788'),
(17, 'Campo Santo','X6745'),

(18,'Jachal','X4900'),
(18,'Pocito','X4700'),
(18,'Rawson','X4600'),
(18,'San Martín','X4500'),
(18,'19','X4300'),

(19, 'Balde','X7894'),
(19, 'Batavia','X7231'),
(19, 'Beazley','X7000'),
(19, 'Buena Esperanza','X7471'),
(19, 'Candelaria','X7111'),

(20,'Hipólito Yrigoyen','X3409'),
(20,'Los Antiguos','X4399'),
(20,'Perito Moreno','X4000'),
(20,'Pto. San Julián','X4890'),
(20,'Pto. 21','X4583'),

(21, 'Fuentes','X7010'),
(21, 'Funes','X7633'),
(21, 'Gaboto','X7125'),
(21, 'Galisteo','X7123'),
(21, 'Gálvez','X7042'),

(22, 'Los Telares','X7222'),
(22, 'Lugones','X7209'),
(22, 'Malbrán','X7231'),
(22, 'Matara','X7284'),
(22, 'Medellín','X7001'),

(23, 'Río Grande','X3331'),
(23, 'Tolhuin','X4411'),
(23, 'Ushuaia','X8855'),

(24, 'Villa Chiligasta','X8002'),
(24, 'Siete de Abril','X8201'),
(24, 'Quinteros','X8241'),
(24, 'Yánima','X8704'),
(24, 'Yerba Buena','X8991');

select * from LOCALIDADES
where id_provincia=21

insert into BARRIOS (nombre_barrio, id_localidad) values
('1 de mayo	',1),
('16 de noviembre',1),
('2 de septiembre',2),
('20 de junio',2),
('23 de abril',3),
('4 de febrero',3),
('Achaval Peña',4),
('Acosta',4),
('Aeronáutico',5),
('Alberdi',5),
('Alberto',6),
('Alborada Norte',6),
('Alborada Sur',7),
('Alejandro',7),
('Almirante Brown',8),
('Alta Córdoba',8),
('Alto Hermoso',9),
('Alto Palermo',9),
('Alto Verde',10),
('Vélez Sársfield',10),
('Villa Cabrera	',11),
('San Martín',11),
('Altos Sud de San Vicente',12),
('Ameghino Norte',12),
('Ameghino Sud',13),
('1 De Mayo',13),
('Altamira',14),
('Benjamin Matienzo',14),
('Cerveceros',15),
('Jardín Espinosa',15),
('Kennedy',16),
('Las Palmas',16),
('Los Plátanos',17),
('Palmar',17),
('Panamericano',18),
('Poeta Lugones',18),
('Pueyrredon',19),
('Residencial America',19),
('Ampliación Rosedal',20),
('Ampliación San Fernando',20),
('Ampliación San Pablo',21),
('Ampliación Urca',21),
(' Vélez Sarsfield',22),
('Ampliación Yapeyu',22),
('Ana Maria Zumaran',23),
('Apeadero La Tablada',23),
('Arcos I',24),
('Argüello',24),
('Argüello Lourdes',25),
('Argüello Norte',25),
('Arturo Capdevila',26),
('Ate',26),
('Autódromo',27),
('Avenida',27),
('Ayacucho',27),
('Bajada De Piedra',28),
('Bajada San Roque',28),
('Bajo Galan',29),
('Bajo General Paz',29),
('Bella Vista Oeste',30),
('Bella Vista',30),
('Betania',31),
('Bialet Masse',31),
('Boedo',32),
('Brigadier San Martín',32),
('Cabaña del Pilar',33),
('Cabo Farina',33),
('Caceres',34),
('Caceres',34),
('Camino A Villa Posse',35),
('Carbo',35),
('Carola Lorenzini',36),
('Carrara',36),
('Caseros',37),
('Centro',37),
('Centro América',38),
('Cerro Chico',38),
('Cerro de las Rosas',39),
('Cerro Norte',39),
('Cerveceros',40),
('Chateau Carreras',40),
('Ciudadela',41),
('Cofico',41),
('Colinas de Bella Vista',42),
('Colinas de Vélez Sársfield',42),
('Colinas del Cerro',43),
('Colinas del Cerro Ampliación',43),
('Colón',44),
('Colonia Lola',44),
('Comandante Espora',45),
('Comercial',45),
('Congreso',46),
('Consorcio Esperanza',46),
('Cooperativa La Unidad',47),
('Córdoba 4',47),
('Córdoba 5',48),
('Corral de Palos',48),
('Country Club',49),
('Country Fortín del Pozo',49),
('Country Jockey Club',50),
('Country Las Delicias',50),
('Country Lomas de la Carolina',51),
('Crisol Norte',51),
('Crisol Sud',52),
('Cupani',52),
('De Los Bioquímicos',53),
('Dean Funes',53),
('Ducasse',54),
('Ejército Argentino',54),
('El Cabildo',55),
('El Cerrito',55),
('El Pueblito',56),
('El Quebracho',56),
('El Refugio',57),
('El Trébol',57),
('Emaus',58),
('Empalme',58),
('Empalme Casas De Obreros Y Empleados',59),
('Escobar',59),
('Estación Flores',60),
('Ferrer',60),
('Ferreyra',61),
('Ferroviario Mitre',61),
('Finca La Dorotea',62),
('General Artigas',62),
('General Belgrano',63),
('General Bustos',63),
('Obrero',64),
('Observatorio',64),
('Ombu',65),
('Oña',65),
('OSN',66),
('Padre Claret',66),
('Palermo Bajo',67),
('Palmar',67),
('Panamericano',68),
('Parque Alameda',68),
('Parque Atlantica',69),
('Patricios Este',69),
('Patricios',70),
('Patria',70),
('Parque Chacabuco',71),
('Paso De Los Andes',71),
('Parque Vélez Sarsfield',72),
('Portal Del Jacaranda',72),
('Policarpio Cabral',73),
('Policial',73),
('Posta De Vargas',74),
('Primera Junta',74),
('Providencia',75),
('Puente Blanco',75),
('Quebrada De Las Rosas',76),
('Quinta Santa Ana',76),
('Quintas De Arguello',77),
('Quintas De San Jorge',77),
('Ramón J Carcano',78),
('Recreo Del Norte',78),
('Remedios De Escalada',79),
('Renacimiento',79),
('Rene Favaloro',80),
('Residencial America',80),
('Residencial Aragón',81),
('Residencial Chateau',81),
('Residencial Olivos',82),
('Residencial San Carlos',82),
('Residencial San Jorge',83),
('Rivadavia',83),
('Rivera Indarte',84),
('Rogelio Martínez',84),
('Rosedal',85),
('Rosedal Anexo',85),
('Sachi',86),
('San Antonio',86),
('San Cayetano',87),
('San Daniel',87),
('San Felipe',88),
('San Fernando',88),
('San Francisco',89),
('San Ignacio',89),
('San Javier',90),
('San José',90),
('San Lorenzo',91),
('San Lorenzo Norte',91),
('San Luis De Francia',92),
('San Marcelo',92),
('San Martín',93),
('Santa Isabel',93),
('Santa Rita',94),
('Sargento Cabral',94),
('Sarmiento',95),
('SEP',95),
('SMATA',96),
('Suárez',96),
('Tablada Park',97),
('Tejas Del Sur',97),
('Teniente Benjamin Matienzo',98),
('Teodoro Felds	',98),
('Tranviarios',99),
('Urca',99),
('Uritorco',100),
('Urquiza',100),
('Valle del Cerro',101),
('Vicor',101),
('Villa 4 de Agosto',102), --102, 106 localidad 50
('Villa 9 de Julio',102),    
('Villa Adela',103),
('Villa Alberdi',103),
('Villa Alicia Risler',104),
('Villa Allende Parque',104),
('Villa Argentina',105),
('Villa Aspacia',105),
('Villa Ávalos',106),
('Villa Azalais',106),
('Villa General Urquiza',107),
('Villa Mafekin',107),
('Villa Marta',108),
('Villa Martínez',108),
('Villa Páez',109),
('Villa Quisquizacate',109),
('Villa Retiro',110),
('Villa Revol',110),
('Villa Revol Anexo',111),
('Villa Rivadavia',111),
('Villa Rivera Indarte',112),
('Villa Saldan',112),
('Villa San Carlos',113),
('Villa San Isidro',113),
('Villa Serrana',114),
('Villa Siburu',114),
('Villa Silvano Funes',115),
('Villa Solferino',115),
('Villa Union',116),
('Villa Warcalde',116),
('Vivero Norte',117),
('Yapeyu',117),
('Yofre H',118),
('Yofofito',118),
('Yayo',119),
('Yuliango',119);

set dateformat dmy
select * from barrios

insert into CLIENTES(nombre_cliente, apellido_cliente, telefono_cliente, fecha_nac, id_barrio) values
('Juan', 'Gonzales', '12345678','20/04/1989',60),
('Julian','Gomez','87654321','13/07/1997',45),
('Franco','Sanchez','24581256','11/12/1971',38),
('Esteban','Paredes','47289154','27/05/1984',136),
('Matias','Martinez','98712131','19/02/1969',170),
('German','Gonzales','3564669980','09/04/1978',49),
('Juan','Savedra','4568978980','25/08/2000',98),
('Pedro','Ramirez','6590435567','12/09/1978',123),
('Josefina','Rodriguez','980765435','30/07/1999',89 ),
('Agustina','Sanchez','8970987654','15/03/2001',76);

insert into OPCIONES_PAGO(opcion_de_pago)values('Efectivo'),('Debito'),('Credito'),('Transferencia');

insert into TIPOS_DNI(descripcion)values
 ('DNI'),
 ('Licencia de Conducir'),
 ('Libreta Civica'),
 ('Pasaporte'),
 ('Cedula de Enrolamiento')

alter table TIPOS_DNI
alter column descripcion varchar(50);



 insert into FACTURAS(fecha,id_cliente,id_pago)values 
('06/02/2022', 2, 3),
('16/05/2023', 2, 1),
('26/04/2023', 11, 2),
('10/04/2023', 4, 2),
('22/08/2022', 6, 1),
('29/01/2023', 7, 1),
('24/12/2022', 8, 1),
('26/11/2011', 10, 3),
('15/05/2023', 4, 3),
('14/05/2023', 7, 1);

INSERT INTO TIPOS_VUELOS(tipo_vuelo)values 
('economico'),
('turista'),
('ejecutivo'),
('primera clase');

INSERT INTO LUGARES (lugar)
values ('Asia milenaria'),
('Africa salvaje'),
('Europa diferente'),
('Islas exoticas'),
('Estados Unidos'),
('Sudamerica mistica');

INSERT INTO DESTINOS (id_lugar,precio)values 
(1, 10000),
(2, 12000),
(3, 15000),
(4, 18000),
(5, 20000),
(6, 22000);

insert into DETALLES(id_factura,precio,descuento,recargo)values
 (10,50000,0.5,0.0),
 (12,45000,0.0,0.3),
 (13,57000,0.2,0.0),
 (14,35000,0.0,0.2),
 (15,70000,0.25,0.0),
 (16,58500,0.0,0.15);

 
  insert into RESERVAS(id_cliente,cantidad_dias,cantidad_escalas)values
 (11,10,0),
 (2,15,2),
 (3,18,1),
 (4,7,0),
 (5,20,3),
 (6,9,2),
 (7,3,0),
 (8,12,1),
 (9,38,3),
 (10,5,0);

 insert into PASAJEROS (id_reserva,nombre,apellido,telefono,e_mail,genero,id_tipo_dni,dni)values
(3,'Gustavo','Salcedo',3564589632,'gustavosalcedo@gmail.com','masculino',6,38368793),
(4,'Cintia','Masud',3564612481,'cintiamasud@gmail.com','femenino',6,23175601),
(1,'Alejandra','Gonzales',0351758963,'alejandragonzalez@gmail.com','femenino',9,548962),
(2,'Roman','Gonzalez',0364178987,'romangonzalez@gmail.com','masculino',6,45487776),
(5,'Martin','Zeballos',0265795153,'martinzeballos@gmail.com','masculino',9,48431537),
(6,'Liliana','Martinez',0235478652,'lilimartinez@gmail.com','femenino',10,478526),
(7,'Roxana','Gimenez',0451875249,'roxanagimenez@gmail.com','femenino',6,78456954),
(8,'Miguel','Merentiel',0556852963,'miguemerentiel@gmail.com','masculino',8,874562),
(9,'Santiago','Lopez',0652258749,'santilopez@gmail.com','masculino',6,45479521),
(10,'Guillermina','Rodriguez',0456854732,'guillerodriguez','femenino',9,548712);

insert into ORIGENES(origen)
values('Ezeiza'),
('Ambrosio Taravella'),
('Aero Parque'),
('Islas Malvinas'),
('El Plumerillo');


insert into PASAJES(id_pasajero,id_destino, id_tipo_vuelo, id_origen, horario, fecha_emision, id_detalle)values
(4, 5, 4, 5, (convert(time,'22:30:00')), '26/05/2023', 5), 
(2, 4, 3, 2, (convert(time,'23:00:04')), '26/05/2023', 3),
(5, 5, 2, 2, (convert(time,'18:30:00')), '11/05/2023', 4),
(7, 5, 4, 5, (convert(time,'20:45:00')), '21/05/2023', 4),
(1, 1, 1, 4,(convert(time,'12:30:00')), '22/04/2023', 6),
(9, 2, 3, 1, (convert(time,'08:20:00')), '09/05/2023', 3),
(3, 5, 4, 5, (convert(time,'22:30:00')), '16/04/2023', 5),
(6, 1, 3, 3, (convert(time,'16:20:00')), '15/11/2023', 3),
(8, 5, 3, 2, (convert(time,'13:10:00')), '23/02/2023', 6),
(10, 4, 2, 2,(convert(time,'23:50:00')), '12/03/2023', 6);

--Se requiere mostrar los pasajes, con el nombre del pasajero, el tipo de vuelo que va a realizar, desde y hacia donde viaja,
--con su respectiva fecha, horario y precio final.

SELECT p1.id_pasaje, p2.apellido + ', ' + p2.nombre AS PASAJERO, t.tipo_vuelo AS 'TIPO DE VUELO',
o.origen AS 'DESDE', i.lugar AS 'HACIA',SUBSTRING(CONVERT(VARCHAR,p1.horario , 120), 12, 8)
+ ' ' + LEFT(p1.fecha_emision, 11) AS 'HORA Y FECHA', (CAST(det.precio AS float) - det.descuento + det.recargo) AS 'PRECIO FINAL'
FROM pasajes p1
JOIN pasajeros p2 ON p1.id_pasajero = p2.id_pasajero
LEFT JOIN tipos_vuelos t ON p1.id_tipo_vuelo = t.id_tipo_vuelo
LEFT JOIN origenes o ON p1.id_origen = o.id_origen
LEFT JOIN destinos d ON p1.id_destino = d.id_destino
LEFT JOIN lugares i ON d.id_lugar = i.id_lugar
LEFT JOIN detalles det ON p1.id_detalle = det.id_detalle;

--Mostrar nombre y apellido de los pasajeros que compraron pasaje en la segunda quincena de mayo de 2023 para viajar a Estados Unidos 
--y que el origen del vuelo sea El Plumerillo. Ordenarlos alfabeticamente

SELECT p1.nombre +', '+ p1.apellido 'Nombre completo',p2.id_destino Destino, p2.id_origen Origen,p2.fecha_emision 'Fecha de compra'
from pasajeros p1 
join pasajes p2 on p1.id_pasajero = p2.id_pasajero 
where (p2.id_origen = 5 and p2.id_destino = 5)
and (year(fecha_emision) = 2023 and
month(fecha_emision) = 05 and
day(fecha_emision) between 15 and 31)
order by 'Nombre completo' asc
--and (p2.fecha_emision between '01/05/2023' and '31/05/2023') 

--Realizar una consulta de las facturas cuyo nombre de cliente comienza con la letra P o A, que se haya realizado en el año 2022 y hayan sido pagadas en efectivo,
--si se realizo algun tipo de descuento o recargo, se busca saber el precio final ordenado de mayor a menor

SELECT c.nombre_cliente+' '+ (c.apellido_cliente) 'NOMBRE Y APELLIDO',d.precio 'PRECIO INICIAL',
d.precio * d.descuento 'DESCUENTO',d.precio *d.recargo'RECARGO', f.fecha FECHA, P.opcion_de_pago 'OPCION DE PAGO',
d.precio+(d.precio*d.recargo)-(d.precio*d.descuento) 'PRECIO FINAL'
from CLIENTES c join FACTURAS f on c.id_cliente=f.id_factura
join DETALLES d on d.id_detalle = f.id_factura
join OPCIONES_PAGO P on f.id_pago = p.id_opcion_pago
where year(fecha) = 2022
and p.opcion_de_pago = 'Efectivo'
and c.nombre_cliente like '[P,A]%'
order by 7 desc

--Realizar la consulta de las reservas pudiendo observar el nombre completo del cliente (APELLIDO EN MAYUSCULA) donde el apellido comienza con letras de la D hasta la S y su numero de contacto, si viajaran 10 o mas dias y que no realizan escalas
--se busca saber los datos del pasajero que tome la reserva

select upper(c.apellido_cliente)+' '+ C.nombre_cliente 'REALIZA LA RESERVA',c.telefono_cliente 'NUMERO DE CONTACTO',
r.cantidad_dias DIAS, r.cantidad_escalas ESCALAS, p.apellido+ ' ' +p.nombre 'PASAJERO', t.id_tipo_dni 'TIPO DOCUMENTO',
p.dni 'DNI' , p.genero GENERO, p.e_mail 'CORREO ELECTRONICO',p.telefono 'TELEFONO DE CONTACTO'
from CLIENTES c join RESERVAS r on r.id_cliente=c.id_cliente
join PASAJEROS p on r.id_reserva = p.id_reserva
join TIPOS_DNI t on t.id_tipo_dni = p.id_tipo_dni
where apellido_cliente between 'D' and 'S'
and cantidad_dias <= 10 
and cantidad_escalas = 0

-- Mostrar el listado de clientes con su apellido, nombre y destino, que viajen entre una y dos semanas y que paguen en efectivo.
--Ademas que muestre el precio mas caro primero y un telefono de contacto

 SELECT c.apellido_cliente +', '+ nombre_cliente 'NOMBRE',l.lugar 'DESTINO', r.cantidad_dias as 'DIAS', op.opcion_de_pago 'OPCION DE PAGO',
 d.precio 'PRECIO', c.telefono_cliente 'N° TELEFONO'
 FROM CLIENTES c
 JOIN RESERVAS r ON c.id_cliente = r.id_cliente
 JOIN FACTURAS f ON c.id_cliente = f.id_cliente
 JOIN OPCIONES_PAGO op ON f.id_pago = op.id_opcion_pago
 JOIN DETALLES d ON c.id_cliente = d.id_detalle
 JOIN PASAJEROS p ON p.id_reserva = r.id_reserva
 JOIN PASAJES pa ON pa.id_pasajero = p.id_pasajero
 JOIN DESTINOS de ON pa.id_destino = de.id_destino
 JOIN LUGARES l ON de.id_lugar = l.id_lugar
 where op.opcion_de_pago = 'Efectivo'
 and r.cantidad_dias > 7 and r.cantidad_dias <14
 order by precio desc

 --Realizar una consulta que muestre el barrio y nombre del o los clientes que hayan nacido antes del 2000 y sea de
 --genero femenino. El precio debe ser mayor a 50.000. Mostrar de mayor a menor segun su precio

SELECT b.nombre_barrio 'BARRIO',c.nombre_cliente +', ' +apellido_cliente 'Nombre completo',fecha_nac 'FECHA DE NACIMIENTO'
,p.genero 'GENERO',precio 'PRECIO'
from BARRIOS b 
join CLIENTES c on b.id_barrio =c.id_barrio
join RESERVAS r on r.id_cliente=c.id_cliente
join PASAJEROS p  on p.id_reserva=r.id_reserva
join FACTURAS f on f.id_cliente=c.id_cliente
join DETALLES d on d.id_factura =f.id_factura
where (p.genero='femenino') and (d.precio >=50000)
and (year(c.fecha_nac) < 2000)
order by PRECIO desc

