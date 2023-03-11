public class SOSLChallenges {
    public List<List<sObject>> Tom(){
        List<List<sObject>> result = [
            FIND 'Tom*'
            IN Name FIELDS
            RETURNING
            	Contact(FirstName, LastName),
            	Lead(FirstName, LastName)
            LIMIT 5
        ];
        return result;
    }
    
    public List<List<sObject>> Eyoooo(){
        return [
            FIND '*a*o*'
            IN All FIELDS
            RETURNING
            	Account(Name, Id)
        ];
    }
    
    public List<List<sObject>> Robin(){
        return [
            FIND '*1000'
			IN PHONE FIELDS
			Returning
				Account(Name),
				Contact(FirstName, LastName),
				Lead(FirstName, LastName)
        ];
    }
}