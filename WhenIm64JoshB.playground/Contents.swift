//When I'm 64?
//Calculates what year your 64th birthday will be in.

//Class for a person, can store birthday and calculate when they will be 64
class person{
	//variables for storing birthdays
	var name: String = ""
	var bmonth: Int = -1
	var bday: Int = -1
	var byear: Int = -1
	var sixfouryear: Int = -1
	
	//Initialization function for easy setup
	init(name: String, bmonth: Int, bday: Int, byear: Int){
		self.name = name
		self.bmonth = bmonth
		self.bday = bday
		self.byear = byear
	}
	
	//Calculates what year you will be 64 after checking your inputs.
	func sixfourcalc(){
		if(bmonth <= 0 || bmonth > 12){
			print("Invalid birth month.")
			return
		}
		if(bday <= 0 || bday > 31){
			print("Invalid birth day.")
			return
		}
		if(byear > 2017){
			print("Invalid birth year.")
			return
		}
		sixfouryear = byear + 64
		print("\(name) will be 64 on \(bmonth)/\(bday)/\(sixfouryear).")
	}
}

//Three test instances of people.
var josh: person = person(name: "Josh", bmonth:7, bday:16, byear:1994)
josh.sixfourcalc()
var bobby: person = person(name: "Bobby", bmonth:4, bday:12, byear:1989)
bobby.sixfourcalc()
var trevor: person = person(name: "Trevor", bmonth:4, bday:16, byear:1991)
trevor.sixfourcalc()