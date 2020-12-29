<?php

define('SERVEUR','localhost');
define('BDD','sprintdecembre.sql');
define('USER','root');
define('PASS','');

try {
    //code...
    $connexion = new PDO('mysql:host=' . SERVEUR . ';dbname=' . BDD , USER, PASS);
    $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "connexion a bdd ok"; 
} catch (PDOException $e) {
    $msg = 'ERREUR dans '. $e->getFile() . 'Ligne : ' . $e->getLine().' : ' . $e->getMessage();exit($msg);
    
    //throw $th;
} catch (Exception $e) {
echo 'définis les instructions en cas d\'erreur';
}