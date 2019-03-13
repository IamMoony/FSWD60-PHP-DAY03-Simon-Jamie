<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<?php
	class retailer
	{

		public function createConn($a,$b,$c,$d) {
			$conn = mysqli_connect($a,$b,$c,$d);

			if(!$conn){
				echo "connection error";
			}
			return $conn;
		}

		public function runQuery($conn) {
			$sql = "SELECT * from retailer";
			$result = mysqli_query($conn, $sql);
			if(!$result){
				echo "error no result";
			}
			echo "hello";
			return $result;
		}


		public function fetchData($query) {
			$rows = $query->fetch_all(MYSQLI_ASSOC);

			if(!$rows){ 
				echo "error no rows";
			}
			echo "test";
			foreach ($rows as $val) {
				
			
				echo $val["RetailerID"];
				echo $val["RetailerName"];
				
			}
		}

		

	}

	$myRetailer = new retailer();
	$test=$myRetailer->createConn("localhost", "root", "moony#1423", "book");
	$test2=$myRetailer->runQuery($test);
	$myRetailer->fetchData($test2);

	?>

</body>
</html>