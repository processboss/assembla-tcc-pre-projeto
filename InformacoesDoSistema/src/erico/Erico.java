package erico;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

public strictfp class Erico {

    public static void main(String[] args) throws Exception {
	String ls_str;

	Set<Processo> lista = new TreeSet<Processo>();

	Process ls_proc = Runtime.getRuntime().exec("cmd /C TASKLIST /V /fo csv");
	BufferedReader ls_in = new BufferedReader(new InputStreamReader(ls_proc.getInputStream()));

	while ((ls_str = ls_in.readLine()) != null) {
	    Processo processo = new Processo();
	    Scanner scanner = new Scanner(ls_str);
	    scanner.useDelimiter("\"");

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

	for (Processo processo : lista) {
	    System.out.println(processo);
	}

    }

}
