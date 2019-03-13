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

				public function insertData(){
					if (isset($_POST["submit"])) {
						$RetailerID = mysqli_real_escape_string(createConn(), $_POST['RetailerID']);
						$RetailerName = mysqli_real_escape_string(createConn(), $_POST['RetailerName']);
						$RetailerAddress = mysqli_real_escape_string(createConn(), $_POST['RetailerAddress']);
						$RetailerPLZ = mysqli_real_escape_string(createConn(), $_POST['RetailerPLZ']);
						$RetailerCity = mysqli_real_escape_string(createConn(), $_POST['RetailerCity']);
						$RetailerCountry = mysqli_real_escape_string(createConn(), $_POST['RetailerCountry']);
						$sql = "INSERT INTO retailer (RetailerID,RetailerName,RetailerAddress,RetailerPLZ,RetailerCity,RetailerCountry) VALUES ('$RetailerID', '$RetailerName','$RetailerAddress', '$RetailerPLZ', '$RetailerCity','$RetailerCountry')";
						if (mysqli_query(createConn(), $sql)){
							echo "New Record Created";

						} else {
							echo "Record Creation Error for: " .$sql . mysqli_error(createConn());
						}

					}

				}

				public function fetchData($query) {
					$rows = $query->fetch_all(MYSQLI_ASSOC);

					if(!$rows){ 
						echo "error no rows";
					}

					foreach ($rows as $val) {


						echo "<tr><td>".$val["RetailerID"]."</td><td>".$val["RetailerName"]."</td><td>".$val["RetailerAddress"]."</td><td>".$val["RetailerPLZ"]."</td><td>".$val["RetailerCity"]."</td><td>".$val["RetailerCountry"]."</td><td><button>Edit</button></td><td><button>Delete</button></td></tr>";

					}
				}
			}

			$myRetailer = new retailer();
			$test=$myRetailer->createConn("localhost", "root", "", "book");
			$test2=$myRetailer->runQuery($test);
			$myRetailer->fetchData($test2);

			?>
		</tbody>
	</table>
</body>
</html>