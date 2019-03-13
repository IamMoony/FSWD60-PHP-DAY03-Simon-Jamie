<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="">
</head>
<body>
	
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
			/*echo "Your name is ".$this->firstname." ".$this->lastname. " and your birthdate is ".$this->birthdate. " and you are ".$this->age. " old, and you are ".$this->gender. ". <br>";*/		
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
				return "Your name is ".$this->firstname." ".$this->lastname. " and your birthdate is ".$this->birthdate. " and you are ".$this->age. " old, and you are ".$this->gender. ". I live in " . $this->city.", "  .$this->country. ".<br>";
			}
		}
		$LocationObj = new CountryLocation('Jamie', 'Slaats', 1977, 42,'Male');
		$LocationObj1 = new CountryLocation('Simon', 'Blaha', 1990, 28,'sexy af');
		$result = $LocationObj->addLocation();
		$result1 = $LocationObj1->addLocation();
		echo $result;
		echo $result1;
		
	?>	
</body>
</html>