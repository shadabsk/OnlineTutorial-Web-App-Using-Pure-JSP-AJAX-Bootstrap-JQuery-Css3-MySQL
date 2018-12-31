<?php
require_once('DB.php');
	
	class Showcourse extends Database{

		function __construct()
		{
			$this->connect_db();

		}

		 public function getroll($uname){
			
			$sql = "SELECT RNO FROM student WHERE Username='$uname'";
			$res = mysqli_query($this->connection, $sql);
			while ($row=mysqli_fetch_array($res)) {
				$RNO=$row['RNO'];
			}
		
			$sql1 = "SELECT CID FROM takes where RNO='$RNO'";
			$res1 = mysqli_query($this->connection, $sql1);
			while ($row=mysqli_fetch_array($res1)) {
				$CID=$row['CID'];
			}
			
	
			$sql2 = "SELECT Topic,content,Weightage,Name,Media FROM tutorial where CID='$CID'";
			$res2 = mysqli_query($this->connection, $sql2);
			return $res2;
		}

		public function getcontent($CTopic){
			$sql2 = "SELECT content,Media FROM tutorial where Topic='$CTopic'";
			$res2 = mysqli_query($this->connection, $sql2);
			return $res2;
		}


		}
$Showcourse=new Showcourse();
?>