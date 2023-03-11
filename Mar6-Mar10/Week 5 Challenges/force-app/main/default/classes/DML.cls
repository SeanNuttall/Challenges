public class DML {
    public void SpawnContacts(){
        List<Contact> addContacts = new List<Contact>();
        for(Integer i = 0; i < 200; i++){
            Contact addMe = new Contact(
            	LastName = 'Contact ' + i
            );
            addContacts.add(addMe);
        }
        insert addContacts;
    }
    
    public void CreateHomes(){
        List<Account> addAccounts = new List<Account>();
        for(Integer i = 0; i < 3; i++){
            Account addMe = new Account(
            	Name = 'Acme ' + (i+1)
            	);
            addAccounts.add(addMe);
        }
        insert addAccounts;
    }
    
    public void Relocate(){
        List<Contact> recentContacts = [SELECT FirstName, LastName FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        delete recentContacts;
    }
    
    public void AssignHomes(){
        List<Contact> challContacts = [SELECT Name FROM Contact WHERE LastName LIKE 'Contact %'];
        List<Account> challAccounts = [SELECT Id FROM Account WHERE Name LIKE 'Acme %'];
        Double rando;
        Integer randoInt;
        
        for(Contact con : challContacts){
            rando = math.Random() * challAccounts.size();
            randoInt = rando.intValue();
            con.AccountId = challAccounts[randoInt].Id;
        }
		update challContacts;        
    }
}