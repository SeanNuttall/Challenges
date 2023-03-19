// Challenges 9, 11, 12

public class AccountsAndContactsController {
    
    public List<Account> AllAccounts { get; set; }
    transient public List<Account> FilteredAccounts { get{
        List<Account> temp = new List<Account>();
        for(Account acc : AllAccounts){
            String AcctName = acc.Name;
            if(AcctName.contains(SearchTerm)){
                temp.add(acc);
            }
        }
        return temp;
    }
                                                    }
    public String SearchTerm { get; set; }
    
    public AccountsAndContactsController(){
        AllAccounts = [SELECT Name, (SELECT Name FROM Contacts) FROM Account];
        SearchTerm = '';
    }
    
    //public void FilterAccounts(){
    //FilteredAccounts = new List<Account>();
    //for(Account acc : AllAccounts){
    //String AcctName = acc.Name;
    //if(AcctName.contains(SearchTerm)){
    //FilteredAccounts.add(acc);
    //}
    //}
    //System.Debug(FilteredAccounts);
    //}
}