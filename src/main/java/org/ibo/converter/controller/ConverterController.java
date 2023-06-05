package org.ibo.converter.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.ibo.converter.xmlopen.ConvertServlet;
import org.ibo.converter.xmlopen.Store;
import org.ibo.converter.xmlopen.Utils;
import org.ibo.converter.xmlopen.WebSubmission;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ConverterController {

	static Logger logger = LoggerFactory.getLogger(ConverterController.class);

	@Autowired
	ServletContext sc;
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;
	@Value("${temp-folder}")
	private String tempFolder;
	@Value("${nix-invoke}")
	private String nix_invoke;
	@Value("${win-invoke}")
	private String win_invoke;
	private String fileName;

	public String getTempFolder() {
		return tempFolder;
	}

	@GetMapping("/jats-convert")
	public String viewHomePage(Model model) {
		return "form";
	}

	@PostMapping("/jats-convert")
	protected ResponseEntity<Resource> doPost(@RequestParam("candidate") MultipartFile file) throws IOException {
		String ipAddress = req.getHeader("X-Forward-For");

		if (ipAddress == null) {

			ipAddress = req.getRemoteAddr();
		}
		logger.info("Received request from user " + ipAddress);

		Store.init(tempFolder, true); // to get the storage layer up
		// and
		// running
		WebSubmission sub = new WebSubmission(file);
		int retCode = 200;
		try {
			retCode = sub.fetchFromClient();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // persists body of request to file system

		if (retCode != 200) {
			logger.trace("returning HTTP response code " + sub.getResponseErr());
			// resp.sendError( retCode, sub.getResponseErr() );
			return null;
		}
		fileName = file.getOriginalFilename();
		final ClassLoader classLoader = Store.class.getClassLoader();


		String dir =classLoader.getResource(".").getFile() + tempFolder + File.separator + sub.uuid.toString();
		String filename = dir + File.separator + sub.uuid.toString() + ".bin";

		byte[] ba = null;
		try {
			ba = Utils.resourceFromFile(filename);
		} catch (IOException e) {
			// TODO Auto-generatd catch block
			e.printStackTrace();
		}
		String ret = Utils.isResourceXml(ba);
String path = null;
		if (ret == null) // It's XML
		{
			try {
				path=new ConvertServlet().doConvert( resp, fileName, sub.uuid,
			            fileName, tempFolder, nix_invoke, win_invoke );
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// delete working folder
			ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(Path.of(path)));

			String contentType = Files.probeContentType(Path.of(path));

			if (contentType == null) {
				// Use the default media type
				contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
			}

			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache");
			headers.add("Content-Disposition", "attachment; filename=\"" + file.getOriginalFilename().split("\\.")[0]+ ".odt\"");
			Store.delete(sub.uuid);

			return ResponseEntity.ok()
					.headers(headers)
					.contentLength((int) resource.contentLength())
					.contentType(MediaType.valueOf(contentType))
					.body(resource);

		} else {
			logger.error("File is not XML, returning error");
			try {
				resp.sendError(500, ret);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return null;
	}
}
