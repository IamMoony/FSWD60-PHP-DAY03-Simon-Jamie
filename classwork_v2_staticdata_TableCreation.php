<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Static Data PHP Input</title>
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
	
	<table class="table table-striped">
		<thead class="thread-dark">
			<tr>
				<th scope="col">First Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Birth Date</th>
				<th scope="col">Age</th>
				<th scope="col">Gender</th>
				<th scope="col">City</th>
				<th scope="col">Country</th>
			</tr>
		</thead>
		<tbody>

			<?php 
		/**Created a class called people, with data inside. Then crated the construct using the data and 
		as well the usage of $this->. 
		 * 
		 */
		class people {
			public $firstname;
			public $lastname;
			public $birthdate;
			public $age;
			public $gender;

			function __construct($firstname,$lastname,$birthdate,$age,$gender){
				$this->firstname = $firstname;
				$this->lastname = $lastname;
				$this->birthdate = $birthdate;
				$this->age = $age;
				$this->gender = $gender;
			}

			public function setPerson () {
					return "<tr><td>" .$this->firstname. "</td><td>" . $this->lastname. "</td><td>" .$this->birthdate. "</td><td>" . $this->age. "</td><td>" .$this->gender. "</td>";
			}

		}
		/*$Jamie = new people('Jamie', 'Slaats', 1977, 42,'Male');
		$Simon = new people('Simon', 'Blaha', 1990, 28,'sexy af');
		$Jamie->setPerson();
		$Simon->setPerson();*/

		/**
		 * 
		 */
		class CountryLocation extends people
		{
			public $city = "Vienna";
			public $country = "Austria";

			public function addLocation() {
				return $this->setPerson(). "<td>" .$this->city. "</td><td>" .$this->country. "</td><td><button>Edit</button><button>Delete</button></td></tr>";
			}
		}
		$LocationObj = new CountryLocation('Jamie', 'Slaats', 1977, 42,'Male');
		$LocationObj1 = new CountryLocation('Simon', 'Blaha', 1990, 28,'sexy af');
		$result = $LocationObj->addLocation();
		$result1 = $LocationObj1->addLocation();
		echo $result;
		echo $result1;
		
		?>
	</tbody>
</table>	
</body>
</html>