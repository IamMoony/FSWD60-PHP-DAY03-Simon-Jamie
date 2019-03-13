<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
<h2>Form</h2>
  <form class="form-horizontal" action="" method="POST">
    <div class="form-group">
      <label class="control-label col-sm-2" for="full_name">RetailerID</label>
      <div class="col-sm-10">
        <input type="name" class="form-control" id="firstname" placeholder="" name="RetailerID">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Name</label>
      <div class="col-sm-10">          
        <input type="lastname" class="form-control" id="lastname" placeholder="" name="RetailerName">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Address</label>
      <div class="col-sm-10">          
        <input type="" class="form-control" id="zip-code" placeholder="" name="RetailerAddress">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">PLZ</label>
      <div class="col-sm-10">          
        <input type="" class="form-control" id="zip-code" placeholder="" name="RetailerPLZ">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">City</label>
      <div class="col-sm-10">          
        <input type="" class="form-control" id="zip-code" placeholder="" name="RetailerCity">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Country</label>
      <div class="col-sm-10">          
        <input type="" class="form-control" id="zip-code" placeholder="" name="RetailerCountry">
      </div>
    </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="submit">Submit</button>
      </div>
    </div>
  </form>
</div>
</div>

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

				public function insertData($conn){
					
						$RetailerID = mysqli_real_escape_string($conn, $_POST['RetailerID']);
						$RetailerName = mysqli_real_escape_string($conn, $_POST['RetailerName']);
						$RetailerAddress = mysqli_real_escape_string($conn, $_POST['RetailerAddress']);
						$RetailerPLZ = mysqli_real_escape_string($conn, $_POST['RetailerPLZ']);
						$RetailerCity = mysqli_real_escape_string($conn, $_POST['RetailerCity']);
						$RetailerCountry = mysqli_real_escape_string($conn, $_POST['RetailerCountry']);
						$sql = "INSERT INTO retailer (RetailerID,RetailerName,RetailerAddress,RetailerPLZ,RetailerCity,RetailerCountry) VALUES ('$RetailerID', '$RetailerName','$RetailerAddress', '$RetailerPLZ', '$RetailerCity','$RetailerCountry')";
						if (mysqli_query($conn, $sql)){
							echo "New Record Created";

						} else {
							echo "Record Creation Error for: " .$sql . mysqli_error($conn);
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
			$establishconn=$myRetailer->createConn("localhost", "root", "", "book");
			$ourquery=$myRetailer->runQuery($establishconn);
			$myRetailer->fetchData($ourquery);
			if (isset($_POST["submit"])) {
				$myRetailer->insertData($establishconn);
			}

			?>
		</tbody>
	</table>
</body>
</html>