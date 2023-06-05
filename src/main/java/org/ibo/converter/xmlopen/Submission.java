package org.ibo.converter.xmlopen;

import java.io.File;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Represents the inputs to a validation session. This includes a resource to be validated
 * (which may need to be de-referenced) and options to affect the validation process.
 */
abstract public class Submission
{
    static Logger logger = LoggerFactory.getLogger( Submission.class );
    public UUID uuid;



    public String getCandidateFile()
    {
        if( uuid == null )
        {
            throw new IllegalStateException( "No resource has been localized" );
        }

        return Store.getFilename( uuid );
    }


    public File getEntryFile( String entryName )
    {
        if( uuid == null )
        {
            throw new IllegalStateException( "No resource has been localized" );
        }

        return new File( Store.urlForEntry( uuid, entryName ) );
    }


 

    
}
