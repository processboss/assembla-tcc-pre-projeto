package felipe.model.scanner;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class UnixProcessScanner implements ProcessScanner{

	@Override
	public void readAllProcess() {
		
		try {
			Process p = Runtime.getRuntime().exec("ps ax"); //aqui fica o comando que vai pegar os processos  
			
			BufferedReader resultado = new BufferedReader(new InputStreamReader(p.getInputStream()));  
			
			//mostra os resultados obtidos pelo comando 'ps ax'  
			String s;  
			while ((s = resultado.readLine()) != null)  
				System.out.println(s);  
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
