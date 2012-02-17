package felipe.testes;

import felipe.model.scanner.ProcessScanner;
import felipe.model.scanner.ProcessScannerFactory;

public class Teste {

	public static void main(String[] args) {
		
		ProcessScanner scanner = ProcessScannerFactory.getInstance();
		
		scanner.readAllProcess();
		
	}
}
