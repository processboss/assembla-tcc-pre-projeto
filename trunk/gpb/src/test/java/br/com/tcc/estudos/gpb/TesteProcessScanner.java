package br.com.tcc.estudos.gpb;

import java.util.Set;

import br.com.tcc.estudos.gpb.core.model.Processo;
import br.com.tcc.estudos.gpb.core.model.scanner.ProcessScanner;
import br.com.tcc.estudos.gpb.core.model.scanner.ProcessScannerFactory;

public class TesteProcessScanner {

	public static void main(String[] args) {
		
		ProcessScanner scanner = ProcessScannerFactory.getInstance();
		
		Set<Processo> processos = scanner.readAllProcess();
		
		for (Processo processo : processos) {
			System.out.println(processo);
		}
		
	}
}
