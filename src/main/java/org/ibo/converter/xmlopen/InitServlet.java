package org.ibo.converter.xmlopen;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import jakarta.servlet.ServletContext;

@SuppressWarnings("serial")
public class InitServlet
{
    Logger logger = LoggerFactory.getLogger(InitServlet.class);

    @Autowired
    ServletContext sc;

    public void init()
    {
        logger.info( "Log4JInitServlet is initializing log4j" );
    }
}
