// Challenges 1, 2, 3, 4, 6

public class ChallengeAccountController {
    
    public string Greet {get;set;}
    public id AccId {get;set;}
    
    public ChallengeAccountController(){
        Greet = '';
        PageReference currPage = ApexPages.currentPage();
        Map<String, String> pageParameters = currPage.getParameters();
        AccId = pageParameters.get('Id');
    }
    
    public Account getAccount(){
        return [SELECT Name, Type, AnnualRevenue, Rating FROM Account WHERE Name LIKE '%Edge%'];
    }

    
    public void Greeting(){
        if(AccId != NULL){
        	Account acc = [SELECT Name FROM Account WHERE Id = :AccId];
        	Greet = 'Hello ' + acc.Name + '! Thank you for visiting our website.';
        }
        Else{
            Greet = 'Hello! Thank you for visiting our website.';
        }
    } 
}