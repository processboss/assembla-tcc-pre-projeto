package br.com.tcc.estudos.gpb.core.model.scanner;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.Set;
import java.util.TreeSet;

import br.com.tcc.estudos.gpb.core.model.Processo;

public class WindowsProcessScanner implements ProcessScanner {

	public Set<Processo> readAllProcess() {
		
		Set<Processo> lista = new TreeSet<Processo>();
		try {
			String ls_str;


			Process ls_proc = Runtime.getRuntime().exec("cmd /C TASKLIST /V /fo csv");
			BufferedReader ls_in = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));

			int count = 0;
			while ((ls_str = ls_in.readLine()) != null) {
			    if(count++ == 0) continue;
			    
				Processo processo = new Processo();
			    java.util.Scanner scanner = new java.util.Scanner(ls_str);
			    scanner.useDelimiter("\"");

			    processo.setData(new Date());
			    
			    processo.setNomeProcesso(scanner.next());
			    scanner.next();
			    processo.setIdentificacaoPessoal(scanner.next());
			    scanner.next();
			    processo.setNomeSessao(scanner.next());
			    scanner.next();
			    processo.setSessao(scanner.next());
			    scanner.next();
			    processo.setUsoMemoria(scanner.next());
			    scanner.next();
			    processo.setStatus(scanner.next());
			    scanner.next();
			    processo.setNomeUsuario(scanner.next());
			    scanner.next();
			    processo.setTempoCPU(scanner.next());
			    scanner.next();
			    processo.setTituloJanela(scanner.next());

			    lista.add(processo);

			}

			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lista;
	}

}
