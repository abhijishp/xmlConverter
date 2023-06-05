package org.ibo.converter.xmlopen;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.TransformerFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.xml.sax.Attributes;

public class Utils
{
    static Logger logger = LoggerFactory.getLogger( Utils.class );
    private final static int READ_BUFFER_SIZE = 32768;
    final public static int CLOSE_NONE = 0x0000;
    final public static int CLOSE_IN = 0x0001;
    final public static int CLOSE_OUT = 0x0010;
    private static final String PROPERTY_TRAX_IMPLEMENTATION = "javax.xml.transform.TransformerFactory";
    private static final String SAXON_TRAX_CLASS = "net.sf.saxon.TransformerFactoryImpl";
    


    /**
     * Returns a new {@link TransformerFactory}&nbsp;(TrAX implementation).
     * 
     * @return a TransformerFactory implementation
     */
    public static TransformerFactory getTransformerFactory()
    {
        System.setProperty( PROPERTY_TRAX_IMPLEMENTATION, SAXON_TRAX_CLASS );
        return TransformerFactory.newInstance();
    }


    public static String getQAtt( Attributes atts, String uri, String name )
    {
        for( int i = 0; i < atts.getLength(); i++ )
        {
            if( atts.getURI( i ).equals( uri ) && atts.getLocalName( i ).equals( name ) )
            {
                return atts.getValue( i );
            }

        }

        return null;
    }


    /**
     * Reads all of an InputStream content into a byte array, and closes that InputStream.
     * 
     * @param in
     *            the InputStream to be read
     * @return byte[] its content
     */
    public static byte[] getBytesToEndOfStream( InputStream in, boolean closeSteam )
            throws IOException
    {
        ByteArrayOutputStream byteStream = new ByteArrayOutputStream();
        transferBytesToEndOfStream( in, byteStream, ( closeSteam ? ( CLOSE_IN | CLOSE_OUT )
                : CLOSE_OUT ) );
        byte[] ba = byteStream.toByteArray();
        return ba;
    } 


    /**
     * GETs the content at a URL and returns it as a byte array.
     * 
     * @param url
     *            - the URL
     * @return a byte array
     */
    public static byte[] derefUrl( URL url )
    {
        byte[] ba = null;

        InputStream is = null;
        try
        {
            // get what's at the url location and put it into a byte array
            URLConnection conn = url.openConnection();
            conn.connect();
            is = conn.getInputStream();
            ba = Utils.getBytesToEndOfStream( is, true ); // does close
        }
        catch( IOException e )
        {
            logger.warn( e.getMessage() );
            return null;
        }

        return ba;

    }


    /**
     * Writes the bytes in <tt>ba</tt> to the file named <tt>fn</tt>, creating it if necessary.
     * 
     * @param ba
     *            the byte array to be written
     * @param fn
     *            the filename of the file to be written to
     * @throws IOException
     */
    public static void writeBytesToFile( byte[] ba, String fn ) throws IOException
    {
        File f = new File( fn );
        f.createNewFile();

        FileOutputStream fos = null;
        ByteArrayInputStream bis = null;

        try
        {
            fos = new FileOutputStream( f );
            bis = new ByteArrayInputStream( ba );
            transferBytesToEndOfStream( bis, fos, CLOSE_IN | CLOSE_OUT );
            System.gc();
        }
        catch( FileNotFoundException e )
        {
            throw new RuntimeException( "File not found when writing: ", e );
            // should never happen
        }

    }


    public static void streamFromFile( String fn, OutputStream os, boolean closeStream )
            throws IOException
    {
        File f = new File( fn );

        try
        {
            FileInputStream fis = new FileInputStream( f );
            int flags = CLOSE_IN;
            if( closeStream )
            {
                flags |= CLOSE_OUT;
            }
            Utils.transferBytesToEndOfStream( fis, os, flags );

        }
        catch( FileNotFoundException e )
        {
            throw new RuntimeException( "File not found when reading: ", e );
        }

    }


    public static long streamToFile( InputStream is, String fn, boolean closeStream )
            throws IOException
    {
        File f = new File( fn );
        f.createNewFile();

        try
        {
            FileOutputStream fos = new FileOutputStream( f );
            int flags = closeStream ? ( CLOSE_IN | CLOSE_OUT ) : CLOSE_OUT;
            return Utils.transferBytesToEndOfStream( is, fos, flags );
        }
        catch( FileNotFoundException e )
        {
            throw new RuntimeException( "File not found when writing: ", e );
        }

    }


    /**
     * Reads all of an InputStream content into an OutputStream, via a buffer.
     * 
     * @param in
     *            the InputStream to be read
     * @return int number of bytes read
     */
    public static long transferBytesToEndOfStream( InputStream in, OutputStream out,
            int closeFlags ) throws IOException
    {

        byte[] buf = new byte[ READ_BUFFER_SIZE + 1 ];

        long written = 0;
        int count;
        while( ( count = in.read( buf ) ) != -1 )
        {
            out.write( buf, 0, count );
            written += count;
        }
        if( ( closeFlags & CLOSE_IN ) != 0 )
        {
            streamClose( in );
        }
        if( ( closeFlags & CLOSE_OUT ) != 0 )
        {

            streamClose( out );
        }

        buf = null;

        return written;
    }


    public static void streamClose( InputStream is )
    {
        try
        {
            if( is != null )
                is.close();
        }
        catch( Exception e )
        {
            // do nothing
        }
    }


    public static void streamClose( OutputStream os )
    {
        try
        {
            if( os != null )
            {
                os.flush();
                os.close();
            }
        }
        catch( Exception e )
        {
            // do nothing
        }
    }

    /**
     * returns null if XML, otherwise String is error msg
     * 
     * @param ba
     * @return
     */
    public static String isResourceXml( byte[] ba )
    {
        String ret = null;

        try
        {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = dbf.newDocumentBuilder();
            builder.setEntityResolver( new BlankingResolver() );

            Document doc = builder.parse( new ByteArrayInputStream( ba ) );
        }
        catch (Exception e)
        {
            ret = e.getMessage();
        }

        return ret;
    }  
   


    static public boolean deleteDir( File path )
    {
        logger.trace( "Deleting folder " + path );
        if( path.exists() )
        {
            File[] files = path.listFiles();
            for( int i = 0; i < files.length; i++ )
            {
                if( files[ i ].isDirectory() )
                {
                    deleteDir( files[ i ] );
                }
                else
                {
                    files[ i ].delete();
                    System.gc(); // hack to try and make JVM/Windows JFDI
                }
            }
        }
        boolean ret = path.delete();
        return ret;
    }
    
    public static boolean isWindows()
    {
        return File.separatorChar == '\\';
    }

 
    public static byte[] resourceFromFile( String fn ) throws IOException
    {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        streamFromFile( fn, baos, true);
        return baos.toByteArray();
        

    }


}
