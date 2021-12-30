//fetch access token using fetch access token class
//call the method on this class
//add company id an minor version in endpoint 
//add access token on header authorization
public class createcustomer {
    @future(callout=True)
    public static void senddata(list<string> slist)
	{
       
	HTTP h = new HTTP();
	HTTPRequest req = new HTTPRequest();
	req.setEndpoint('https://sandbox-quickbooks.api.intuit.com/v3/company/"company_id"/customer?minorversion=63');
	req.setMethod('POST');
	req.setHeader('User-Agent', 'QBOV3-OAuth2-Postman-Collection');
	req.setHeader('Accept', 'application/json');
    req.setHeader('Content-Type', 'application/json');
    req.setHeader('Authorization', 'Bearer' +access token);
        string p='{';
        for(integer i=0;i<slist.size();i++){
            if(i==(slist.size()-1)){
                 p='{"DisplayName":"'+slist[i]+'"}';
            }
                p='{"DisplayName":"'+slist[i]+'"},';
    }
         p=p+'}';
     req.setBody(p);
	HTTPResponse res =h.send(req);
	map<String,object> jsonbody = (map<String,Object>)JSON.deserializeUntyped(res.getBody());
	System.debug(jsonbody);
}	
}
