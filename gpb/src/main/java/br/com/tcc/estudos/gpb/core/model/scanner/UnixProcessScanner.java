package br.com.tcc.estudos.gpb.core.model.scanner;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Set;

import br.com.tcc.estudos.gpb.core.model.Processo;

public class UnixProcessScanner implements ProcessScanner{

	public Set<Processo> readAllProcess() {
		
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
		
		return null;
	}

}
