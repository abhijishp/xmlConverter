/*
 * This file is part of the source of:
 * 
 * JATS App
 * 
 * Developed by Griffin Brown Digital Publishing Ltd.
 * 
 * Contact: alexb@griffinbrown.co.uk
 */

package org.ibo.converter.xmlopen;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Store
{
    static Logger logger = LoggerFactory.getLogger(Store.class);

    static String tmpFolder;
    static boolean webMode;

    static HashMap< UUID, String > localMap = new HashMap< UUID, String >();


    public static void init(String tmpFolder, boolean webMode)
    {
        final ClassLoader classLoader = Store.class.getClassLoader();
        Store.tmpFolder = tmpFolder;
        File tmp = new File( classLoader.getResource(".").getFile() +tmpFolder );
        if( !tmp.isDirectory() )
        {
            tmp.mkdirs();
            tmp.mkdir();
        }

        Store.webMode = webMode;
    }


    public static UUID putZippedResource( Submission sub, InputStream is, String filename )
            throws IOException
    {

        UUID uuid = UUID.randomUUID();
        String fn = filename;
        new File( getDirectory( uuid ) ).mkdir();

        // Save the file locally only for web mode
        if( webMode )
        {
            fn = getDirectory( uuid ) + File.separator + uuid + ".bin";
            logger.info("fn is: "+fn);
            long written = Utils.streamToFile( is, fn, false );
            logger.debug( "Wrote " + written + " bytes to file" );
        }

        localMap.put( uuid, fn );

       
        return uuid;
    }


    public static InputStream getStream( UUID uuid )
    {
        String fn = localMap.get( uuid );
        InputStream is = null;
        if( fn != null )
        {
            File f = new File( fn );

            try
            {
                is = new FileInputStream( f );
            }
            catch( FileNotFoundException e )
            {
                // we'll return null in this case
            }
        }

        return is;
    }


    public static URI urlForEntry( UUID uuid, String name )
    {
        String fn = getDirectory( uuid ) + File.separator + name;
        URI uri = new File( fn ).toURI();
        return uri;
    }


    public static void delete( UUID uuid )
    {
        File dir = new File( getDirectory( uuid ) );
        Utils.deleteDir( dir );
        localMap.remove( uuid );
    }


    public static String getDirectory( UUID uuid )
    {
        final ClassLoader classLoader = Store.class.getClassLoader();

        File tmp = new File( classLoader.getResource(".").getFile() +tmpFolder );

        return tmp + File.separator + uuid;
    }


    public static String getFilename( UUID uuid )
    {
        return localMap.get( uuid );
    }

}