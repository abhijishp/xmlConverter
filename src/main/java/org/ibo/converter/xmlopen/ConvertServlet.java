package org.ibo.converter.xmlopen;

import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

public class ConvertServlet
{
    Logger logger = LoggerFactory.getLogger(ConvertServlet.class);
    synchronized public String doConvert( HttpServletResponse resp, String origFilename, UUID uuid,
            String returnFilename, String tempFolder, String nix_invoke, String win_invoke ) throws IOException
    {
        final ClassLoader classLoader = getClass().getClassLoader();
       // String resultBaseFilename = tempFolder + File.separator + uuid.toString()+File.separator+uuid.toString()+".bin";
       // String resultBaseUri = new File( resultBaseFilename ).toURI().toString();
        String FILE_NAME =new ClassPathResource("jats2odf/dopipe.bat").getPath();
      //  logger.info( "Using working folder of: " + resultBaseUri );

        resp.setHeader( "Cache-Control", "no-cache" );

        boolean hasErrors = false;
        String dir =  tempFolder+"/"+uuid.toString();
        String filename = dir + "/"+ uuid.toString() + ".bin";



        // TODO: do the conversion
        String cmd = Utils.isWindows() ? win_invoke : nix_invoke;
        cmd += " " + filename;
        logger.info( "cmd is: " + cmd );

        String outfile = classLoader.getResource(".").getFile() + tempFolder + File.separator + "odf.odt";
        origFilename = origFilename.replaceAll( "\\.[a-zA-Z]+", ".odt" );
        File f = new File( outfile );
        f.createNewFile();

        try{ synchronized( ConvertServlet.class )
        {

            try
            {
                //final ClassLoader classLoader = getClass().getClassLoader();
                final File file = new File(classLoader.getResource("jats2odf/dopipe.bat").getFile());
                final ProcessBuilder pb = new ProcessBuilder();
                pb.directory(new File(classLoader.getResource(".").getFile()));
                pb.command(file.getPath(),filename);
                Process p=pb.start();
                logger.info(String.valueOf(p.getInputStream().readAllBytes()));
                logger.error(String.valueOf(p.getErrorStream().readAllBytes()));
                p.waitFor();
            }
            catch( Exception e )
            {
                logger.error( e.getMessage() ); // cannot recover
                e.printStackTrace();
            }
            
        }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return f.getAbsolutePath();

    }
    
}


