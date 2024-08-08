package model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyFactory;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import org.json.JSONObject;
import org.json.JSONArray;

/**
 * Utility class for fetching the JSON Web Key (JWK) from a specified URL.
 * This class retrieves the JWK, extracts the public key, and returns it as an RSAPublicKey.
 */
public class Utils {

    /**
     * Fetches the public key from the JWK endpoint.
     *
     * @return RSAPublicKey The public key extracted from the JWK.
     * @throws Exception if there is an error in fetching or processing the JWK.
     */
    public static RSAPublicKey getPublicKey() throws Exception {
        // URL of the JWK endpoint
        String jwksUrl = "https://dev-h42pkcp3clbxcoh5.us.auth0.com/.well-known/jwks.json";
        
        // Open a connection to the URL
        HttpURLConnection connection = (HttpURLConnection) new URL(jwksUrl).openConnection();
        connection.setRequestMethod("GET");

        // Read the response from the URL
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        // Parse the response as a JSON object
        JSONObject jwks = new JSONObject(response.toString());
        JSONArray keys = jwks.getJSONArray("keys");

        // Iterate through the keys to find the one with the "RS256" algorithm
        for (int i = 0; i < keys.length(); i++) {
            JSONObject key = keys.getJSONObject(i);
            if ("RS256".equals(key.getString("alg"))) {
                // Extract the public key string and decode it
                String publicKeyStr = key.getJSONArray("x5c").getString(0);
                publicKeyStr = publicKeyStr.replaceAll("\\s", "");
                byte[] decoded = Base64.getDecoder().decode(publicKeyStr);

                // Generate the public key from the decoded string
                CertificateFactory certFactory = CertificateFactory.getInstance("X.509");
                X509Certificate certificate = (X509Certificate) certFactory.generateCertificate(new java.io.ByteArrayInputStream(decoded));
                RSAPublicKey publicKey = (RSAPublicKey) certificate.getPublicKey();

                return publicKey;
            }
        }

        // Throw an exception if no suitable public key is found
        throw new RuntimeException("No suitable public key found");
    }
}
