<?php
include("MusicJson.php");
$listar=new Listar();
$json= $listar::listarSongs();
echo $json;
?>