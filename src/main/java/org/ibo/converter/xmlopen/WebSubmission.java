package org.ibo.converter.xmlopen;

import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

public class WebSubmission extends Submission {

	static Logger logger = LoggerFactory.getLogger(WebSubmission.class);

	private HttpServletRequest request;
	private String responseErr;
	private String filename;
	MultipartFile file;

	public WebSubmission(MultipartFile req) {
		this.file = req;
	}

	public int fetchFromClient() throws IOException {
		int ret = 200;
		if (file != null && !file.isEmpty()) {
			if (file.getOriginalFilename().endsWith(".zip"))
				parseMultiPart(this.file);
			else
				parseDirect(this.file);
		}
		return ret;
	}

	/**
	 * Retrieves items contained in a multipart servlet request.
	 * 
	 * @param file
	 * @return a map, mapping between item names and the UUIDs for their stored
	 *         values
	 * @throws IOException
	 */
	public void parseMultiPart(MultipartFile file) throws IOException {

		logger.debug("Processing multipart submission");
		// ServletFileUpload upload = new ServletFileUpload();

		try {
			ZipEntry zipEntry;
			ZipInputStream zip;
			// FileItemIterator iter = upload.getItemIterator( req );
			zip = new ZipInputStream(file.getInputStream());
			while ((zipEntry = zip.getNextEntry()) != null) {
				FileItemStream item = (FileItemStream) zipEntry.clone();
				String name = item.getFieldName();

				InputStream sis = item.openStream();

				if (name.equalsIgnoreCase("candidate")) {
					this.filename = item.getName();
					logger.debug("Got file item named: " + filename);
					this.uuid = Store.putZippedResource(this, sis, name);
					sis.close();
					sis = null;
					System.gc();
					logger.debug("Persisted candidate item with UUID: " + this.uuid);
				} else {
					byte[] ba = Utils.getBytesToEndOfStream(sis, true); // closes stream
					String val = new String(ba);
					logger.debug("Setting option " + name + " = " + val);
					// this.optionMap.put( name, val );
				}
			}
		} catch (FileUploadException e) {
			logger.error(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}

	}

	@SuppressWarnings("unchecked")
	public void parseDirect(MultipartFile request) throws IOException {
		logger.debug("Processing direct submission");
		InputStream sis = request.getInputStream();
		this.uuid = Store.putZippedResource(this, sis, null); // closes stream
		this.filename = file.getName();
	}

	public String getResponseErr() {
		return responseErr;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public String getFilename() {
		return filename;
	}

}
