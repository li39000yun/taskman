package org.springside.examples.common.util;

import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.*;
import java.io.IOException;

public class FileDownload extends BodyTagSupport {
	static {
		rb =
			ResourceBundle.getBundle(
				"org.springside.examples.common.util.fileUploadConfig");
	}
	public String fileName;
	public String filePath;
	public String fileNewName;
	private static ResourceBundle rb;
	private String url = rb.getString("fileDownloadServerAddress");

	public int doStartTag() {
		try {
			this.pageContext.getOut().write(getTagString());
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
	public int doEndTag() {
		return EVAL_PAGE;
	}

	public String getTagString() {
		
		String fileUrl = "";
		fileUrl = this.url + "?fileName=" + this.fileName + "&filePath=" + this.filePath + "&fileNewName=" + this.fileName;
		
		if(this.fileName ==null||this.fileName.equals("")){
			return "";
		}
		if(this.fileNewName.contains(".jpg")
				|| this.fileNewName.contains(".png")
				|| this.fileNewName.contains(".gif")
				|| this.fileNewName.contains(".bmp")
				|| this.fileNewName.contains(".jpeg")){
			return "<a href=" + fileUrl + ">"
				+ "<img src=" + fileUrl +"  height='40' width='50'></img>"
				+ "</a>";
		}else{
			if (this.fileNewName == null || this.fileNewName.equals("")) {
				return "<a href=" + fileUrl + ">"
					+ "下载附件"
					+ "</a>";
			}
			
		}
		return "<a href=" + fileUrl + ">"
			+ this.fileNewName
			+ "</a>";
	}

	/**
	 * @return
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @return
	 */
	public String getFileNewName() {
		return fileNewName;
	}

	/**
	 * @return
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * @param string
	 */
	public void setFileName(String string) {
		fileName = string;
	}

	/**
	 * @param string
	 */
	public void setFileNewName(String string) {
		fileNewName = string;
	}

	/**
	 * @param string
	 */
	public void setFilePath(String string) {
		filePath = string;
	}

}
