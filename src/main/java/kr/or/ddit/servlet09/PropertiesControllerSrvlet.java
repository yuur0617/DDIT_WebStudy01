package kr.or.ddit.servlet09;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.jasper.compiler.Node.GetProperty;

import com.fasterxml.jackson.databind.deser.impl.PropertyValue;

import kr.or.ddit.property.dao.InMemoryPropertyDAOImpl;
import kr.or.ddit.property.dao.PropertyDAO;
import kr.or.ddit.servlet08.ServerTimeServlet;
import kr.or.ddit.vo.PropertyVO;

/**
 * 요청의 목적 : 서버사이드의 자원을 대상으로 어떤 행위를 수행하기 위함. 
 * 	자원의 식별(명사) : URI
 * 	어떤 행위(동사) : request method
 * 
 * RESTful URI 구조 표현
 *	/09/property GET : 전체 조회
 *	/09/property/porpertyName(fail.common.msg) GET : 한건 조회
 *	/09/property POST : 등록
 *	/09/property PUT : 전체 수정
 *	/09/property/porpertyName(fail.common.msg) PUT : 한건 수정
 *	/09/property DELETE : 전체 삭제
 *	/09/property/porpertyName(fail.common.msg) DELETE : 한건 삭제
 */
@WebServlet("/09/property/*")
public class PropertiesControllerSrvlet extends HttpServlet{
	private PropertyDAO dao = new InMemoryPropertyDAOImpl("/kr/or/ddit/message/message-common_en.properties");
	
	private int list(HttpServletRequest req) throws IOException, ServletException {

		Set<String> keySet = dao.selectProperties().stream()
								.map(PropertyVO::getPropertyName)//메소드 레퍼런스(람다식 안에서만 사용가능)
								.collect(Collectors.toSet());
		req.setAttribute("keySet", keySet);
		return 200;
	}
	private int single(String propertyName, HttpServletRequest req) {
				
		PropertyVO property = dao.selectProperty(propertyName);
		
		int status = 200;
		
		if(property == null) {
			status= 404;
		}else {
			req.setAttribute("propertyValue",property.getPropertyValue());			
		}
		return status;
		
	}

	@Override //조회
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String requestURI = req.getRequestURI(); //ex) /WebStudy01/09/property, /WebStudy01/09/property/code
			
		String regex = "\\S*/09/property/(\\S+)"; //2번 경우, \s : 공백 한칸, \S : 공백이 아닌 문자 하나, \S+ : 한글자 이상, \S* : 공백이 아닌 문자가 하나이상일수도 아닐수도
		Pattern ptrn = Pattern.compile(regex);
		Matcher matcher = ptrn.matcher(requestURI);
		int status;
		if(matcher.find()) {
			String propertyName = matcher.group(1);
			status = single(propertyName, req);			
		}else {
			status = list(req);			
		}
		
		if(status == 200) {
			String view = "/jsonView.do";
			req.getRequestDispatcher(view).forward(req,resp);
		}else {
			resp.sendError(status);
		}
		
	}
	
	@Override //등록
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	// put과 delete는 비동기요청일때 자주 씀.
	@Override //수정
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
	@Override //삭제
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
