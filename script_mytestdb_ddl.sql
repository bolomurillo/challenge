CREATE SCHEMA IF NOT EXISTS mytestdb
DEFAULT CHARACTER SET utf8;

USE mytestdb ;

DROP TABLE IF EXISTS mytestdb.TVI008_ACTIVIDAD;
DROP TABLE IF EXISTS mytestdb.TVI007_SHOW;
DROP TABLE IF EXISTS mytestdb.TVI006_ESTILO_SHOW;
DROP TABLE IF EXISTS mytestdb.TVI004_CONTRATO;
DROP TABLE IF EXISTS mytestdb.TVI005_METODO_PAGO;
DROP TABLE IF EXISTS mytestdb.TVI003_PLAN;
DROP TABLE IF EXISTS mytestdb.TVI002_STATUS_CONTRATO;
DROP TABLE IF EXISTS mytestdb.TVI001_USUARIO;



-- -----------------------------------------------------
-- Table mytestdb.TVI001_USUARIO
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI001_USUARIO (
  cd_usuario INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de usuario registrado',
  nb_email VARCHAR(70) NOT NULL COMMENT 'Correo electrónico del usuario registrado',
  nb_persona VARCHAR(90) NOT NULL COMMENT 'Nombre propio de usuario registrado',
  nb_apellido VARCHAR(150) NOT NULL COMMENT 'Apellido de usuario registrado',
  fh_alta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha alta de usuario registrado',
  fh_baja TIMESTAMP NULL COMMENT 'Fecha de baja de usuario registrado',
  tx_motivo_baja VARCHAR(200) NULL COMMENT 'Motivo de baja de usuario de registrado',
  st_usuario TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Status del usuario registrado: 1-activo, 0 inactivo',
  PRIMARY KEY (cd_usuario),
  UNIQUE INDEX nb_email_UNIQUE (nb_email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contiene información de los usuarios registrados';


-- -----------------------------------------------------
-- Table mytestdb.TVI002_STATUS_CONTRATO
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI002_STATUS_CONTRATO (
  cd_status_contr INT(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificado unico de status de contrato',
  nb_status_contr VARCHAR(50) NOT NULL COMMENT 'Nombre del status de contrato',
  fh_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creacion de status de contrato',
  PRIMARY KEY (cd_status_contr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de status de contrato';


-- -----------------------------------------------------
-- Table mytestdb.TVI003_PLAN
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI003_PLAN (
  cd_plan INT(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificado unico de plan contratado',
  nb_plan VARCHAR(50) NOT NULL COMMENT 'Nombre del plan contratado',
  im_mensual_plan DECIMAL(10,2) NOT NULL COMMENT 'Importe mensual del plan contratado',
  fh_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creacion de plan contratado',
  fh_baja TIMESTAMP NULL COMMENT 'Fecha de baja de plan contratado',
  st_plan TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Status del plan contratado: 1-activo, 0 inactivo',
  PRIMARY KEY (cd_plan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de Planes';


-- -----------------------------------------------------
-- Table mytestdb.TVI005_METODO_PAGO
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI005_METODO_PAGO (
  cd_metodo_pago INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de metodo de pago de un plan',
  nb_metodo_pago VARCHAR(70) NOT NULL COMMENT 'Nombre del método de pago de un plan',
  fh_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creacion de metodo de pago de un plan',
  st_metodo_pago TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Status del plan contratado: 1-activo, 0 inactivo',
  PRIMARY KEY (cd_metodo_pago)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de métodos de pago de un plan';


-- -----------------------------------------------------
-- Table mytestdb.TVI004_CONTRATO
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI004_CONTRATO (
  cd_contrato INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de contrato de usuario',
  cd_usuario INT(11) UNSIGNED NOT NULL COMMENT 'Identificador unico de usuario',
  cd_plan INT(5) UNSIGNED NOT NULL COMMENT 'Identificado unico de plan contratado',
  fh_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creacion de contrato de usuario',
  cd_metodo_pago INT(3) UNSIGNED NOT NULL COMMENT 'Identificado unico de metodo de pago',
  cd_status INT(3) UNSIGNED NOT NULL COMMENT 'Identificado unico de status de contrato',
  PRIMARY KEY (cd_contrato),
  CONSTRAINT fk_004_002_1 FOREIGN KEY (cd_status) REFERENCES mytestdb.TVI002_STATUS_CONTRATO (cd_status_contr),
  CONSTRAINT fk_004_003_1 FOREIGN KEY (cd_plan) REFERENCES mytestdb.TVI003_PLAN (cd_plan),
  CONSTRAINT fk_004_005_1 FOREIGN KEY (cd_metodo_pago) REFERENCES mytestdb.TVI005_METODO_PAGO (cd_metodo_pago),
  CONSTRAINT fk_004_001_1 FOREIGN KEY (cd_usuario) REFERENCES mytestdb.TVI001_USUARIO (cd_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Condiciones generales del contrato para consumir shows de video';


-- -----------------------------------------------------
-- Table mytestdb.TVI006_ESTILO_SHOW
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI006_ESTILO_SHOW (
  cd_estilo_show INT(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de estilo de show',
  nb_estilo_show VARCHAR(50) NOT NULL COMMENT 'Nombre de estilo de show',
  fh_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de creacion de estilo de show',
  st_estilo_show TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Status del estilo de show: 1-activo, 0 inactivo',
  PRIMARY KEY (cd_estilo_show)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de estilos de show';


-- -----------------------------------------------------
-- Table mytestdb.TVI007_SHOW
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI007_SHOW (
  cd_show INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de show',
  nb_show VARCHAR(70) NOT NULL COMMENT 'Nombre de show',
  cd_estilo_show INT(4) UNSIGNED NOT NULL COMMENT 'Identificador unico de estilo de show',
  du_show INT(6) UNSIGNED NOT NULL COMMENT 'Duración de show (en segundos)',
  nu_episodio VARCHAR(45) NULL COMMENT 'Numero de episodio / temporada',
  to_megabytes INT(11) UNSIGNED NOT NULL COMMENT 'Total de megabytes del archivo de video de show',
  tx_ruta_almacen VARCHAR(255) NOT NULL COMMENT 'Ruta del almacenamiento en servidor del archivo de video de show',
  nu_nivel INT(2) UNSIGNED NOT NULL COMMENT 'Numero de nivel de acceso',
  fh_alta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de alta de show',
  fh_baja TIMESTAMP NULL COMMENT 'Fecha de baja de show',
  PRIMARY KEY (cd_show),
  CONSTRAINT fk_007_006_1 FOREIGN KEY (cd_estilo_show) REFERENCES mytestdb.TVI006_ESTILO_SHOW (cd_estilo_show)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de show disponibles';


-- -----------------------------------------------------
-- Table mytestdb.TVI008_ACTIVIDAD
-- -----------------------------------------------------
CREATE TABLE mytestdb.TVI008_ACTIVIDAD (
  cd_actividad INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de actividad de usuario',
  cd_usuario INT(11) UNSIGNED NOT NULL COMMENT 'Identificador unico de usuario registrado',
  cd_show INT(11) UNSIGNED NOT NULL COMMENT 'Identificador unico de show',
  fh_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() COMMENT 'Fecha de inicio de actividad',
  fh_fin TIMESTAMP NOT NULL COMMENT 'Fecha de fin de actividad',
  du_conexion INT(6) UNSIGNED NOT NULL COMMENT 'Duración de la conexión (en segundos)',
  ct_megabyte INT(11) UNSIGNED NOT NULL COMMENT 'Cantidad de megabytes consumidos',
  PRIMARY KEY (cd_actividad),
  CONSTRAINT fk_008_001_1 FOREIGN KEY (cd_usuario) REFERENCES mytestdb.TVI001_USUARIO (cd_usuario),
  CONSTRAINT fk_008_007_1 FOREIGN KEY (cd_show) REFERENCES mytestdb.TVI007_SHOW (cd_show)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de actividad o consumo de usuario';
