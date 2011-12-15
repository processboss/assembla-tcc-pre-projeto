package marco;
import java.io.File;

public class InformationCollectorComplete {
	
	final static String separador = "======================================================================";

    public static void main(String[] args) {
        
//        System.out.println(separador);
//        System.out.println("#### " + "Informações de Hardware");
//        System.out.println(separador);
//
//        
//        System.out.println("Processadores disponíveis: " + Runtime.getRuntime().availableProcessors() + " cores");
//
//        System.out.println("Free memory: " + Runtime.getRuntime().freeMemory() + " bytes");
//        long maxMemory = Runtime.getRuntime().maxMemory();
//        System.out.println("Maximum memory: " +
//                (maxMemory == Long.MAX_VALUE ? "no limit" : maxMemory) + " bytes");
//        System.out.println("Total memory : " + Runtime.getRuntime().totalMemory() + " bytes");
//
//        /* Get a list of all filesystem roots on this system */
//        File[] roots = File.listRoots();
//
//        /* For each filesystem root, print some info */
//        for (File root : roots) {
//            System.out.println("File system root: " + root.getAbsolutePath());
//            System.out.println("\tTotal space: " + root.getTotalSpace() + " bytes");
//            System.out.println("\tFree space: " + root.getFreeSpace() + " bytes");
//            System.out.println("\tUsable space: " + root.getUsableSpace() + " bytes");
//        }

        
        
        
        
        
        System.out.println(separador);
        System.out.println("");
        System.out.println("");

        System.out.println(separador);
        System.out.println("#### " + "Software information");
        System.out.println(separador);

        System.out.println("");
        System.out.println(separador);
        System.out.println("## " + "Java Virtual Machine (JVM) information");
        System.out.println("JVM specification version: " + System.getProperty("java.vm.specification.version"));
        System.out.println("JVM specification vendor: " + System.getProperty("java.vm.specification.vendor"));
        System.out.println("JVM specification name: " + System.getProperty("java.vm.specification.name"));
        System.out.println("JVM implementation version: " + System.getProperty("java.vm.version"));
        System.out.println("JVM implementation vendor: " + System.getProperty("java.vm.vendor"));
        System.out.println("JVM implementation name: " + System.getProperty("java.vm.name"));

        System.out.println("");
        System.out.println(separador);
        System.out.println("## " + "Java Runtime Enviroment (JRE) informations");
        System.out.println("JRE version: " + System.getProperty("java.version"));
        System.out.println("JRE vendor name: " + System.getProperty("java.vendor"));
        System.out.println("JRE vendor url: " + System.getProperty("java.vendor.url"));
        System.out.println("JRE specification version: " + System.getProperty("java.specification.version"));
        System.out.println("JRE specification vendor: " + System.getProperty("java.specification.vendor"));
        System.out.println("JRE specification name: " + System.getProperty("java.specification.name"));
        System.out.println("JRE installation direcotry: " + System.getProperty("java.home"));

        System.out.println("");
        System.out.println(separador);
        System.out.println("## " + "Java internals / misc");
        System.out.println("Java class format version number: " + System.getProperty("java.class.version"));
        System.out.println("Path of java class: " + System.getProperty("java.class.path"));
        System.out.println("List of paths to search when loading libraries: " + System.getProperty("java.library.path"));
        System.out.println("The path of temp file: " + System.getProperty("java.io.tmpdir"));
        System.out.println("The Name of JIT compiler to use: " + System.getProperty("java.compiler"));
        System.out.println("The path of extension directory or directories: " + System.getProperty("java.ext.dirs"));
        
        System.out.println("");
        System.out.println(separador);
        System.out.println("## " + "OS specific information");
        System.out.println("The name of OS name: " + System.getProperty("os.name"));
        System.out.println("The OS architecture: " + System.getProperty("os.arch"));
        System.out.println("The version of OS: " + System.getProperty("os.version"));
        System.out.println("The File separator: " + System.getProperty("file.separator"));
        System.out.println("The path separator: " + System.getProperty("path.separator"));
        System.out.println("The line separator: " + System.getProperty("line.separator"));

        System.out.println("");
        System.out.println(separador);
        System.out.println("## " + "OS user information");
        System.out.println("The Locale is: " + System.getProperty("user.language"));
        System.out.println("The name of account name user: " + System.getProperty("user.name"));
        System.out.println("The home directory of user: " + System.getProperty("user.home"));
        System.out.println("The current working directory of the user: " + System.getProperty("user.dir"));

        System.out.println(separador);
        System.out.println(separador);
    } // main

}
