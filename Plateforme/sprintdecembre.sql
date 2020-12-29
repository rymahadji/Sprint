DROP TABLE IF EXISTS Etudiants;

DROP TABLE IF EXISTS Rdv;

DROP TABLE IF EXISTS Pieces;

DROP TABLE IF EXISTS Services;

DROP TABLE IF EXISTS Formation;

DROP TABLE IF EXISTS Categorie;

DROP TABLE IF EXISTS Employe;

DROP TABLE IF EXISTS bloque;

DROP TABLE IF EXISTS Necessite;

# -----------------------------------------------------------------------------
#       TABLE : Etudiants
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Etudiants
 (
   id_etud INTEGER(10) NOT NULL  ,
   etc VARCHAR(32)   ,
   plafond_diff INTEGER(4)   ,
   diff_total INTEGER(4)   
   , PRIMARY KEY (id_etud) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Rdv
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Rdv
 (
   id_rdv INTEGER(4) NOT NULL  ,
   id_etud INTEGER(10) NOT NULL  ,
   id_emp INTEGER(4) NOT NULL  ,
   id_srv INTEGER(4) NOT NULL  ,
   date_rdv DATETIME   ,
   conclusion BOOL   ,
   etat_paie TEXT   
   , PRIMARY KEY (id_rdv) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Pieces
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Pieces
 (
   id_pc INTEGER(4) NOT NULL  ,
   nom_pc VARCHAR(32)   
   , PRIMARY KEY (id_pc) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Services
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Services
 (
   id_srv INTEGER(4) NOT NULL  ,
   nom_srv VARCHAR(32)   ,
   prix_srv INTEGER(4)   
   , PRIMARY KEY (id_srv) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Formation
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Formation
 (
   id_formation INTEGER(4) NOT NULL  ,
   date_form DATETIME   
   , PRIMARY KEY (id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Categorie
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Categorie
 (
   id_cat INTEGER(4) NOT NULL  ,
   login VARCHAR(32)   ,
   mdp VARCHAR(32)   ,
   nom_cat VARCHAR(32)   
   , PRIMARY KEY (id_cat) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Employe
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Employe
 (
   id_emp INTEGER(4) NOT NULL  ,
   id_cat INTEGER(4) NOT NULL  ,
   nom_emp VARCHAR(32)   ,
   prenom_emp VARCHAR(32)   
   , PRIMARY KEY (id_emp) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : bloque
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS bloque
 (
   id_emp INTEGER(4) NOT NULL  ,
   id_formation INTEGER(4) NOT NULL  
   , PRIMARY KEY (id_emp,id_formation) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : Necessite
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS Necessite
 (
   id_srv INTEGER(4) NOT NULL  ,
   id_pc INTEGER(4) NOT NULL  
   , PRIMARY KEY (id_srv,id_pc) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE Rdv 
  ADD FOREIGN KEY FK_Rdv_Etudiants (id_etud)
      REFERENCES Etudiants (id_etud) ;


ALTER TABLE Rdv 
  ADD FOREIGN KEY FK_Rdv_Employe (id_emp)
      REFERENCES Employe (id_emp) ;


ALTER TABLE Rdv 
  ADD FOREIGN KEY FK_Rdv_Services (id_srv)
      REFERENCES Services (id_srv) ;


ALTER TABLE Employe 
  ADD FOREIGN KEY FK_Employe_Categorie (id_cat)
      REFERENCES Categorie (id_cat) ;


ALTER TABLE bloque 
  ADD FOREIGN KEY FK_bloque_Employe (id_emp)
      REFERENCES Employe (id_emp) ;


ALTER TABLE bloque 
  ADD FOREIGN KEY FK_bloque_Formation (id_formation)
      REFERENCES Formation (id_formation) ;


ALTER TABLE Necessite 
  ADD FOREIGN KEY FK_Necessite_Services (id_srv)
      REFERENCES Services (id_srv) ;


ALTER TABLE Necessite 
  ADD FOREIGN KEY FK_Necessite_Pieces (id_pc)
      REFERENCES Pieces (id_pc) ;