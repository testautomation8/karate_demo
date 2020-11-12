package petStore;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;


import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;

import static org.junit.Assert.assertTrue;


//@KarateOptions(tags = {"@Delete_Credentials"}, features = {"src/test/java/com/psd2"}
//)

public class PetStoreTest {
    @Test
    public void testParallel() {
        //System.setProperty("karate.env", "preProd");
        Results results = Runner.parallel(getClass(), 1);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }


    public static void generateReport(String karateOutputPath) {


        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        ArrayList<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target/cucumber-report") , "Karate Demo Report");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

    }

    //private static String GenerateTime() {
        //DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM_HH-mm-ss");
        //LocalDateTime now = LocalDateTime.now();
       // return dtf.format(now);
    //}
}


