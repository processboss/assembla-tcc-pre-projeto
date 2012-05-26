package br.com.processboss.core.scanner.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import br.com.processboss.core.scanner.ProcessScanner;

public class UnixProcessScanner implements ProcessScanner{

	//TODO marco.ollivier : falta terminar a implementa��o
	public void readAllProcess(){
		
		try {
			Process p = Runtime.getRuntime().exec("ps aux -e"); //aqui fica o comando que vai pegar os processos  
			
			BufferedReader resultado = new BufferedReader(new InputStreamReader(p.getInputStream()));  
			
			//mostra os resultados obtidos pelo comando 'ps ax'  
			String s;  
			while ((s = resultado.readLine()) != null){
				System.out.println(s);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}