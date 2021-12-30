//it will fetch all invoice from quickbook 
//add the account and amount in salesforce object 
//fetch the access token from fetch access token class
// find you sandbox company id from the quickbook sandbox 

public class fetchinvoice {
   @future(callout=True)
    public static void fetchp(){
           
		HTTP h = new HTTP();
		HTTPRequest req = new HTTPRequest();
		req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/"company id"/query?query=select%20*%20from%20Invoice&minorversion=63');
		req.setMethod('POST');
		req.setHeader('User-Agent', 'QBOV3-OAuth2-Postman-Collection');
		req.setHeader('Accept', 'application/json');
    	req.setHeader('Content-Type', 'application/json');      
    	req.setHeader('Authorization','Bearer "access token"');
    	HTTPResponse res =h.send(req);
		map<string,object> jsonbody = (map<string,Object>)JSON.deserializeUntyped(res.getBody());
        system.debug(jsonbody);
        for(string dd:jsonbody.keyset()){
            system.debug(jsonbody.get(dd));
        }
    //	map<string,object> nn =(map<string,object>)jsonbody.get('');
        map<string,object> pp =(map<string,object>)jsonbody.get('QueryResponse');
    	system.debug(pp);
        list<object> hh =(list<object>)pp.get('Invoice');
        list<string> mainlist=new list<string>();
        list<decimal> amountt=new list<decimal>();
        for(object invv:hh){
            map<string,object> dd=(map<string,object>)invv;
            decimal amount=(decimal)dd.get('Balance');
            map<string,object> cusdata=(map<string,object>)dd.get('CustomerRef');
            string p= (string)cusdata.get('name');
            system.debug(p);
            list<account> aa=[select id from account where name=:p limit 1];
            
            
            if(aa.size()!=0){
                Invoice00__c inv=new Invoice00__c(Account__c=aa[0].id,Amount__c=amount);
                insert inv;
            }
            else{
                continue;
            }
        }
    }
}