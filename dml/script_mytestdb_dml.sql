INSERT INTO mytestdb.TVI001_USUARIO (cd_usuario, nb_email, nb_persona, nb_apellido, fh_alta, fh_baja, tx_motivo_baja, st_usuario)
VALUES
	(1, 'bolo.murillo@gmail.com', 'Rodrigo', 'Murillo', '2020-07-20 05:11:20', NULL, NULL, 1),
	(2, 'elon.musk@tesla.com', 'Elon', 'Musk', '2020-07-20 05:11:45', NULL, NULL, 1),
	(3, 'bill.gates@microsoft.com', 'Bill', 'Gates', '2020-07-20 05:12:10', '2020-07-20 05:20:10', 'Baja por peticion de usuario', 0),
	(4, 'jeff.bezos@amazon.com', 'Jeff', 'Bezos', '2020-07-20 05:13:33', NULL, NULL, 1);


INSERT INTO mytestdb.TVI002_STATUS_CONTRATO (cd_status_contr, nb_status_contr, fh_creacion)
VALUES
	(1, 'Nuevo', '2020-07-20 05:09:00'),
	(2, 'Pendiente', '2020-07-20 05:09:12'),
	(3, 'Cancelado', '2020-07-20 05:09:22');


INSERT INTO mytestdb.TVI003_PLAN (cd_plan, nb_plan, im_mensual_plan, fh_creacion, fh_baja, st_plan)
VALUES
	(1, 'Plan Basico', 315.00, '2020-07-20 05:07:52', NULL, 1),
	(2, 'Plan Intermedio', 399.00, '2020-07-20 05:08:07', NULL, 1),
	(3, 'Plan Premium', 499.00, '2020-07-20 05:08:20', NULL, 1);


INSERT INTO mytestdb.TVI005_METODO_PAGO (cd_metodo_pago, nb_metodo_pago, fh_creacion, st_metodo_pago)
VALUES
	(1, 'Tarjeta de Debito', '2020-07-20 05:05:39', 1),
	(2, 'Tarjeta de Credito', '2020-07-20 05:05:50', 1),
	(3, 'Efectivo', '2020-07-20 05:05:59', 1);


INSERT INTO mytestdb.TVI004_CONTRATO (cd_contrato, cd_usuario, cd_plan, fh_creacion, cd_metodo_pago, cd_status)
VALUES
	(1, 1, 1, '2020-07-20 05:15:25', 2, 1),
	(2, 2, 3, '2020-07-20 05:15:50', 1, 1),
	(3, 3, 3, '2020-07-20 05:16:13', 1, 3),
	(4, 4, 2, '2020-07-20 05:16:34', 3, 1);


INSERT INTO mytestdb.TVI006_ESTILO_SHOW (cd_estilo_show, nb_estilo_show, fh_creacion, st_estilo_show)
VALUES
	(1, 'Pelicula', '2020-07-20 05:17:15', 1),
	(2, 'Serie TV', '2020-07-20 05:17:24', 1),
	(3, 'Noticias', '2020-07-20 05:17:37', 1),
	(4, 'Documental', '2020-07-20 05:17:50', 1);


INSERT INTO mytestdb.TVI007_SHOW (cd_show, nb_show, cd_estilo_show, du_show, nu_episodio, to_megabytes, tx_ruta_almacen, nu_nivel, fh_alta, fh_baja)
VALUES
	(1, 'Avengers', 1, 8415, '1', 337, '/peliculas/avengers.tv', 1, '2020-06-20 05:19:52', NULL),
	(2, 'Lord of the Rings I', 1, 7990, '1', 400, '/peliculas/lotr1.tv', 1, '2020-06-20 05:21:03', NULL),
	(3, 'Lord of the Rings II', 1, 8050, '2', 410, '/peliculas/lotr2.tv', 1, '2020-06-20 05:21:57', NULL),
	(4, 'Lord of the Rings III', 1, 8000, '3', 397, '/peliculas/lotr3.tv', 1, '2020-06-20 05:22:41', NULL),
	(5, 'The Big Bang Theory S1 E1', 2, 1100, '1', 67, '/series/tbbt_s11.tv', 2, '2020-07-20 05:24:29', NULL),
	(6, 'The Big Bang Theory S1 E2', 2, 1009, '2', 70, '/series/tbbt_s12.tv', 2, '2020-07-20 05:25:05', NULL),
	(7, 'The Big Bang Theory S1 E3', 2, 997, '3', 71, '/series/tbbt_s13.tv', 2, '2020-07-20 05:25:50', NULL),
	(8, 'The Walking Dead S1 E1', 2, 1201, '1', 68, '/series/twd_s11.tv', 2, '2020-06-20 05:27:05', NULL),
	(9, 'The Walking Dead S1 E2', 2, 1190, '2', 70, '/series/twd_s12.tv', 2, '2020-06-20 05:27:36', NULL),
	(10, 'The Walking Dead S1 E3', 2, 1175, '3', 69, '/series/twd_s13.tv', 2, '2020-07-20 05:28:13', NULL),
	(11, 'CNN Noticias Latinoamerica', 3, 540, '1', 44, '/noticias/cnnlat.tv', 2, '2020-06-20 05:29:02', NULL),
	(12, 'Me llaman Malala', 4, 1120, '1', 300, '/documentales/malala.tv', 3, '2020-07-20 05:30:04', NULL);


INSERT INTO mytestdb.TVI008_ACTIVIDAD (cd_actividad, cd_usuario, cd_show, fh_inicio, fh_fin, du_conexion, ct_megabyte)
VALUES
	(1, 1, 2, '2020-06-20 05:31:38', '2020-06-20 05:32:38', 60, 5),
	(2, 1, 2, '2020-06-20 05:33:35', '2020-06-20 05:35:35', 120, 11),
	(3, 1, 1, '2020-07-20 05:40:29', '2020-07-20 05:43:29', 180, 16),
	(4, 2, 5, '2020-07-20 05:35:42', '2020-07-20 05:38:42', 180, 18),
	(5, 2, 5, '2020-07-20 05:39:08', '2020-07-20 05:43:08', 240, 22),
	(6, 4, 12, '2020-07-20 05:17:19', '2020-07-20 05:27:19', 600, 510),
	(7, 4, 8, '2020-07-20 15:13:10', '2020-07-20 15:24:10', 710, 535);
