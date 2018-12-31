<?php
require_once'DB.php';

class CSchema extends Database{

	function __construct()
	{
		$this->connect_db();
		$this->Schema();
	}

	function Schema(){
		if($_POST)
		{	
				session_start();
				$uname=$_SESSION['username'];
				$coursename=$_POST['cname'];
				$duration=$_POST['cduration'];
				$outcome=$_POST['cout'];
				$requisit=$_POST['prereq'];

				$sql1="INSERT into Course (CID,CName,COutcome,CDuration,CPrereq,Last_Modified) values ('','$coursename','$outcome','$duration','$requisit',now())";	
				$res=mysqli_query($this->connection,$sql1);


				$sql2="select FID from Faculty where username='$uname'";
				$res2=mysqli_query($this->connection,$sql2);
				while ($row=mysqli_fetch_array($res2)) {
					$FID=$row['FID'];
				}

				$sql3="select MAX(CID) from Course";
				$res3=mysqli_query($this->connection,$sql3);
				while ($row1=mysqli_fetch_array($res3)) {
					$CID=$row1['MAX(CID)'];
				}


				$sql4="INSERT into Teaches (CID,FID,Year) values ('$CID','$FID',YEAR(CURDATE()))";
				$res4=mysqli_query($this->connection,$sql4);
				
				if($res4)
				{
					echo 'true';
				}
				else 
				{
					echo 'false';
				}
			
		}
		else
		{
			echo 'false';
		}
	}
}
$CSchema=new CSchema();
?>