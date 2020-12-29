<!DOCTYPE html>
  


<?php

try {


require_once('connect.php');

$connexion = new PDO('mysql:host='.SERVEUR.';bdd='.BDD,USER,PASS);

$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$connexion->query('SET NAMES UTF8');

if (isset($_POST['connexion']) && !empty($_POST['login']) && !empty($_POST['mdp'])){
  $login = $_POST['login'];
  $mdp = $_POST['mdp']; 
  $requete='INSERT INTO sprintdecembre.sql VALUES(0,'$login','$msg')';
    
}


}
