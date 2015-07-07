package com.corporate.transport.ldap;




import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import javax.naming.AuthenticationException;
import javax.naming.CommunicationException;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

public class LDAPAuthentication {

	public int authenticate(String username, String password)
	{
		
		Hashtable authEnv = new Hashtable();

		String mcEnvKeyPath = "MC_ENV_PATH";
		String envPropPath = System.getenv(mcEnvKeyPath);
		System.out.println("Path is 1 :"+envPropPath);
		
		String propertyFilePath = envPropPath + "ldap.properties";
		System.out.println("Path is 2 :"+propertyFilePath);
		
		if (envPropPath == null) {
			System.out.println("envPropPath os :"+envPropPath);
			envPropPath = System.getProperty(mcEnvKeyPath);
			System.out.println("envPropPath os 1:"+envPropPath);
		}
		
		System.out.println("Environment variable path to read is :"+envPropPath);
		ResourceBundle rb = null;
		FileInputStream fis = null;
		int resp = 2;
		try {
			File file = new File(propertyFilePath);
			if (file.exists()) {
				fis = new FileInputStream(file);
				rb = new PropertyResourceBundle(fis);
				String[] urls = rb.getString("url").split(",");
				List ldapURLs = new ArrayList();
				Collections.addAll(ldapURLs, urls);

				authEnv.put("java.naming.factory.initial", rb.getString("INITIAL_CONTEXT_FACTORY"));

				authEnv.put("java.naming.security.authentication", rb.getString("SECURITY_AUTHENTICATION"));

				authEnv.put("java.naming.security.principal", username);
				authEnv.put("java.naming.security.credentials", password);

				Iterator itr = ldapURLs.iterator();

				while (((resp == 2) || (resp == 0)) && (itr.hasNext())) {
					authEnv.put("java.naming.provider.url", itr.next().toString());
					resp = makeCall(authEnv);
				}
			}
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return resp;
	}

	private int makeCall(Hashtable authEnv) {
		System.out.println("Connecting to:" + authEnv.get("java.naming.provider.url"));
		try
		{
			DirContext authContext = new InitialDirContext(authEnv);
			return 1;
		} catch (AuthenticationException authEx) {
			return 0;
		} catch (CommunicationException cEx) {
			return 2;
		} catch (NamingException namEx) {
			namEx.printStackTrace();
		}return 3;
	}
}