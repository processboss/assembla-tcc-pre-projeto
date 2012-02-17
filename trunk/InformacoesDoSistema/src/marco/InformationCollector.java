package marco;
import java.io.File;
import java.io.IOException;

class InformationCollector {

	//http://download.oracle.com/javase/1.4.2/docs/api/java/lang/System.html
	//pesquisar sobre JNI
	public static void main(String[] args) throws IOException {

		Runtime runTime = Runtime.getRuntime();  
		
		System.out.println("\n============SOBRE O SO============\n");
		System.out.println("Nome do SO......................: " + System.getProperty("os.name"));
		System.out.println("Versão do SO....................: " + System.getProperty("os.version"));
		System.out.println("Arquitetura do SO...............: " + System.getProperty("os.arch"));
		
        System.out.println("Separador de arquivos...........: " + System.getProperty("file.separator"));
        System.out.println("Separador de pastas.............: " + System.getProperty("path.separator"));
        System.out.println("Separador de linha..............: " + System.getProperty("line.separator"));
		
		System.out.println("Pasta do Program Files..........:" + System.getenv("programfiles"));

		System.out.println("\n============SOBRE O USUARIO============\n");
		System.out.println("Nome do Usuario.................: " + System.getProperty("user.name"));
		System.out.println("Pasta do usuario no sistema.....:" + System.getProperty(("user.home")));
        System.out.println("Local do usuario................: " + System.getProperty("user.language"));
        System.out.println("Diretório corrente de trabalho..: " + System.getProperty("user.dir"));
		
		System.out.println("\n============SOBRE A JVM============\n");
		System.out.println("Memoria livre na JVM.....................: " + runTime.freeMemory() + " Bytes");
		System.out.println("Memoria total na JVM.....................: " + runTime.totalMemory() + " Bytes");		
		System.out.println("Quantidade maxima que a JVM tentata usar.: " + runTime.maxMemory() + " Bytes");
		
		System.out.println("Versao da especificacao da JVM...........: " + System.getProperty("java.vm.specification.version"));
		System.out.println("'Vendedor' da especificacao da JVM.......: " + System.getProperty("java.vm.specification.vendor"));
		System.out.println("Nome da especificacao da JVM.............: " + System.getProperty("java.vm.specification.name"));
		
        System.out.println("Vers�o da implementa��o da JVM...........: " + System.getProperty("java.vm.version"));
        System.out.println("'Vendedor' da implementa��o da JVM.......: " + System.getProperty("java.vm.vendor"));
        System.out.println("Nome da implementa��o da JVM: " + System.getProperty("java.vm.name"));
		
        System.out.println("\n============SOBRE A JRE============\n");
        System.out.println("Vers�o da JRE.......................: " + System.getProperty("java.version"));
        System.out.println("'Nome do 'vendedor' da JRE..........: " + System.getProperty("java.vendor"));
        System.out.println("URL do 'vendedor' da JRE............: " + System.getProperty("java.vendor.url"));
        System.out.println("Vers�o da especifica��o da JRE......: " + System.getProperty("java.specification.version"));
        System.out.println("Especifica��o do 'vendedor' da JRE..: " + System.getProperty("java.specification.vendor"));
        System.out.println("Nome da especifica��o da JRE........: " + System.getProperty("java.specification.name"));
        System.out.println("Diret�rio de instala��o da JRE......: " + System.getProperty("java.home"));
        
        System.out.println("\n============SOBRE O JAVA============\n");
		System.out.println("Vers�o do Java..................: " + System.getProperty("java.version"));
        
		System.out.println("\n============SOBRE O HARDWARE============\n");
		System.out.println("Processadores...................: " + runTime.availableProcessors() + " cores");   
		
		File[] unidades = File.listRoots();
		System.out.println("Unidades de Armazenamento");
		for(File unidade : unidades){
			System.out.println("\tCaminho absoluto.......: " + unidade.getAbsolutePath());
			System.out.println("\tEspa�o total...........: " + unidade.getTotalSpace() + " bytes");
			System.out.println("\tEspa�o livre...........: " + unidade.getFreeSpace() + " bytes");
			System.out.println("\tEspa�o utiliz�vel......: " + unidade.getUsableSpace() + " bytes");
			System.out.println("\t-------------------------------------------------------------------\n");
		}
		
		System.out.println("\n============OUTRAS INFORMA��ES============\n");
        System.out.println("Java class format version number: " + System.getProperty("java.class.version"));
        System.out.println("Path of java class: " + System.getProperty("java.class.path"));
        System.out.println("List of paths to search when loading libraries: " + System.getProperty("java.library.path"));
        System.out.println("The path of temp file: " + System.getProperty("java.io.tmpdir"));
        System.out.println("The Name of JIT compiler to use: " + System.getProperty("java.compiler"));
        System.out.println("The path of extension directory or directories: " + System.getProperty("java.ext.dirs"));
		
		//EXECU��ES
		runTime.gc(); //executa o Garbage Collector
		runTime.exec("calc"); //chama um aplicativo de acordo com o comando do terminal
	}

}