
<?php
require_once('controleur/controleur.php');
echo'hello i am ici';
if(isset($_POST['Se connecter'])){
    $login=$_POST['username'];
    $passwd=$_POST['password'];
    seConnecter($login,$passwd);
}else {
    cltAcceuil();
}
