<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
	<table class="table">
		<thread>
			<tr>
				<th>Retailer ID</th>
				<th>Name</th>
				<th>Address</th>
				<th>PLZ</th>
				<th>City</th>
				<th>Country</th>
			</tr>
		</thread>
	<tbody>

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
		
			return $result;
		}


		public function fetchData($query) {
			$rows = $query->fetch_all(MYSQLI_ASSOC);

			if(!$rows){ 
				echo "error no rows";
			}
		
			foreach ($rows as $val) {
				
			
				echo "<tr><td>".$val["RetailerID"]."</td>";
				echo "<td>".$val["RetailerName"]."</td>";
				echo "<td>".$val["RetailerAddress"]."</td>";
				echo "<td>".$val["RetailerPLZ"]."</td>";
				echo "<td>".$val["RetailerCity"]."</td>";
				echo "<td>".$val["RetailerCountry"]."</td></tr>";
				
			}
		}

		

	}

	$myRetailer = new retailer();
	$test=$myRetailer->createConn("localhost", "root", "moony#1423", "book");
	$test2=$myRetailer->runQuery($test);
	$myRetailer->fetchData($test2);

	?>
</tbody>
</table>
</body>
</html>