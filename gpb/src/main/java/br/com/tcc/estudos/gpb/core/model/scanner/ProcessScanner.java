package br.com.tcc.estudos.gpb.core.model.scanner;

import java.util.Set;

import br.com.tcc.estudos.gpb.core.model.Processo;

public interface ProcessScanner {

	Set<Processo> readAllProcess();
	
}
