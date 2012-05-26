package test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import com.sshtools.j2ssh.SshClient;
import com.sshtools.j2ssh.authentication.AuthenticationProtocolState;
import com.sshtools.j2ssh.authentication.PasswordAuthenticationClient;
import com.sshtools.j2ssh.configuration.SshConnectionProperties;
import com.sshtools.j2ssh.connection.ChannelOutputStream;
import com.sshtools.j2ssh.session.SessionChannelClient;

public class SshExample {

	private static BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
	
	//http://www.codeproject.com/Articles/46891/Remote-interactive-SSH-command-in-Java
	//http://www.guj.com.br/java/207220-conexao-ssh
	public static void main(String[] args) {
		
		try {
			
			SshClient ssh = new SshClient();
			
//			System.out.println("Host to Connect: ");
//			String hostname = reader.readLine();

			SshConnectionProperties properties = new SshConnectionProperties();
//			properties.setHost(hostname);
			properties.setHost("niteroi");
			properties.setPort(22);
			ssh.connect(properties);
			
			PasswordAuthenticationClient pwd = new PasswordAuthenticationClient();
			
//			System.out.println("Username: ");
//			String username = reader.readLine();
//			pwd.setUsername(username);
			pwd.setUsername("wiclinic");
			
//			System.out.println("Password: ");
//			String password = reader.readLine();
//			pwd.setPassword(password);
			pwd.setPassword("wiclinic");
			
			int result = ssh.authenticate(pwd);
			
			if(result == AuthenticationProtocolState.FAILED) System.out.println("FALHOU");
			if(result == AuthenticationProtocolState.PARTIAL) System.out.println("PARCIALMENTE");
			if(result == AuthenticationProtocolState.COMPLETE) System.out.println("PASSOU");
			
			SessionChannelClient session = ssh.openSessionChannel();
			//session.requestPseudoTerminal("ansi", 1024, 48, 0, 0, null);  
			
			if (session.startShell()) {
				ChannelOutputStream out = session.getOutputStream();
				out.write("cd public_html\n".getBytes());
				out.write("ls -la\n".getBytes());
			}
			
			InputStream in = session.getInputStream();
			byte buffer[] = new byte[255];
			int read;
			while((read = in.read(buffer)) > 0) {
			   String outIn = new String(buffer, 0, read);
			   System.out.println(outIn);
			}
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
