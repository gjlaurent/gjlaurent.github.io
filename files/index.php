<?php

function listing($repertoire){

$fichier = array();

if (is_dir($repertoire)){

$dir = opendir($repertoire); //ouvre le repertoire courant désigné par la variable
while(false!==($file = readdir($dir))){ //on lit tout et on récupere tout les fichiers dans $file

if(!in_array($file, array('.','..'))){ //on eleve le parent et le courant '. et ..'

$page = $file; //sort l'extension du fichier
$page = explode('.', $page);
$nb = count($page);
$nom_fichier = $page[0];
for ($i = 1; $i < $nb-1; $i++){
$nom_fichier .= '.'.$page[$i];
}
if(isset($page[1])){
$ext_fichier = $page[$nb-1];
if(!is_file($file)) { $file = '/'.$file; }
}
else {
if(!is_file($file)) { $file = '/'.$file; } //on rajoute un "/" devant les dossier pour qu'ils soient triés au début
$ext_fichier = '';
}

if($ext_fichier != 'php' and $ext_fichier != 'html') { //utile pour exclure certains types de fichiers à ne pas lister
array_push($fichier, $file);
}
}
}
}

natcasesort($fichier); //la fonction natcasesort( ) est la fonction de tri standard sauf qu'elle ignore la casse

foreach($fichier as $value) {
echo '<a href="'.rawurlencode($repertoire).'/'.rawurlencode(str_replace ('/', '', $value)).'">'.$value.'</a><br />';
}

 }

 //exemple d'utilisation :
?>
<?
$utilisateur = "smart"; // Votre nom d'utilisateur
$mot_de_passe = "surface"; // Votre mot de passe

if (isset($_POST['login']) && isset($_POST['pass']))
{
}
else
{
$_POST['login'] = "";
$_POST['pass'] = "";
}

if ($_POST['login'] == "$utilisateur" && ($_POST['pass'] == "$mot_de_passe")) // Si le nom d'utilisateur et le mot de passe sont corrects
{

 listing('.'); //chemin du dossier

}
else
{
if ($_POST['login'] != "" || ($_POST['pass'] != "")) // Si le nom d'utilisateur ou le mot de passe est incorrect
{
?>
<center><font color="red">Mauvais mot de passe ou mauvais nom d'utilisateur!</font></center>
<?
}
?>
<center><form action="index.php" method="post">
Utilisateur:<br><input type="text" name="login" /><br>
Mot de passe:<br><input type="password" name="pass" /><br>
<input type="submit" value="Valider" />
</form></center>
<?
}
?>

