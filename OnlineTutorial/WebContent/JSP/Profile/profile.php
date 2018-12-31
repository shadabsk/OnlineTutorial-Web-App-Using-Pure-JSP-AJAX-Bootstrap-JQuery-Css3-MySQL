<?php
require_once('DB.php');
	
	class Profile extends Database{

		function __construct()
		{
			$this->connect_db();

		}

		 public function pfselect($name){
			
			$sql = "SELECT * FROM `users` WHERE Username='$name'";
			$res = mysqli_query($this->connection, $sql);
			return $res;
		}
	}
$profile=new Profile();
?>