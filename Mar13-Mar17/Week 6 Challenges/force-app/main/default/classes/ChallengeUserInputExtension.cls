// Challenges 7, 8, 13, 14

public class ChallengeUserInputExtension {
	
    public String chosenAcc {get;set;}
    public Account acc {get;set;}
    
    public ChallengeUserInputExtension(ApexPages.StandardSetController controller){
        
    }
    
    public List<SelectOption> getAccountChoices(){
        List<SelectOption> returnValue = new List<SelectOption>();
        List<Account> allAccounts = [SELECT Name FROM Account];
        
        for(Account acc2 : allAccounts){
            returnValue.add(new SelectOption(acc2.Name, acc2.Name));
        }
        return returnValue;
    }
    
    public void submitAccount(){
        acc = [SELECT Name, Phone, Industry, AnnualRevenue FROM Account WHERE Name = :chosenAcc];
    }
    
    public List<String> getContacts(){
        List<Contact> cons= [SELECT Name FROM Contact WHERE Account.Name = :chosenAcc];
        List<String> contactNames = new List<String>();
        for(Contact con : cons){
            contactNames.add(con.Name);
        }
        return contactNames;
    }
}