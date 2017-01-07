package org.springside.examples.common.util;

import java.io.IOException;

import javax.servlet.jsp.tagext.BodyTagSupport;
import java.util.*;

public class FileUpload extends BodyTagSupport {
	private static ResourceBundle rb;

	  static {
		rb = ResourceBundle.getBundle("org.springside.examples.common.util.fileUploadConfig");
	  }
	public String fileMax = "";
	public String filePath = "";
	public String errFormat = "";
	public String userId = "";
	public String oldFileId = "";
	public String newFileId = "";
	public String fileNum = "";
	public String optionType = "";
	public String realName = "";
	public String url =rb.getString("fileUploadServerAddress");
	public int doStartTag(){
		try {
			this.pageContext.getOut().write(getJavaScript());
			this.pageContext.getOut().write(getTap());
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}
	public int doEndTag() {
		return EVAL_PAGE;
	}
	
	public String getJavaScript(){
		StringBuffer sb = new StringBuffer();
		sb.append("<script language='javascript'>");
		sb.append("function fileupload"+this.oldFileId+"(){");
		sb.append("var action='"+this.url+"?userid="+this.userId+"&filenum="+this.fileNum+"&filepath="+this.filePath+"&filemax="+this.fileMax+"&oldfileid="+this.oldFileId+"&newfileid="+this.newFileId+"&optionType="+this.optionType+"&realName="+this.realName+"';");	
		sb.append("window.open(action,'smallwin1','width=400,height=600,status=yes,resizable=no,scrollbars=yes');}");
		sb.append("</script>");
		return sb.toString();
	}
	
	public String getTap(){
		
		return "<input type='button' value='upload' onclick='fileupload"+this.oldFileId+"()' class='button'>";
	}

	/**
	 * @return
	 */
	public static ResourceBundle getRb() {
		return rb;
	}

	/**
	 * @return
	 */
	public String getErrFormat() {
		return errFormat;
	}

	/**
	 * @return
	 */
	public String getFileMax() {
		return fileMax;
	}

	/**
	 * @return
	 */
	public String getFileNum() {
		return fileNum;
	}

	/**
	 * @return
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * @return
	 */
	public String getNewFileId() {
		return newFileId;
	}

	/**
	 * @return
	 */
	public String getOldFileId() {
		return oldFileId;
	}

	/**
	 * @return
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @return
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param bundle
	 */
	public static void setRb(ResourceBundle bundle) {
		rb = bundle;
	}

	/**
	 * @param string
	 */
	public void setErrFormat(String string) {
		errFormat = string;
	}

	/**
	 * @param string
	 */
	public void setFileMax(String string) {
		fileMax = string;
	}

	/**
	 * @param string
	 */
	public void setFileNum(String string) {
		fileNum = string;
	}

	/**
	 * @param string
	 */
	public void setFilePath(String string) {
		filePath = string;
	}

	/**
	 * @param string
	 */
	public void setNewFileId(String string) {
		newFileId = string;
	}

	/**
	 * @param string
	 */
	public void setOldFileId(String string) {
		oldFileId = string;
	}

	/**
	 * @param string
	 */
	public void setUrl(String string) {
		url = string;
	}

	/**
	 * @param string
	 */
	public void setUserId(String string) {
		userId = string;
	}
	public String getOptionType() {
		return optionType;
	}
	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}

}
