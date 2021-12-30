//code by:charchit Nirayanwal
//refresh token refresh in every 100 days take that from postman
//access token and refresh token on "res"


public class callquick {
    public static void main(){
        String url = 'https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer';
        String clientId = 'client id';
        String clientSecret = 'client_secret';
        String header = 'Basic ' + EncodingUtil.base64Encode(Blob.valueOf(clientId + ':' + clientSecret));
        String refresh_token = 'refresh token from postman';
        String body = 'grant_type=refresh_token&refresh_token=' + refresh_token;

        //Start http request
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        req.setEndpoint(url);
        req.setMethod('POST');
        req.setBody(body);
        req.setHeader('Authorization', header);
        req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        res = h.send(req);
        System.debug(res.getBody());
    }
    }