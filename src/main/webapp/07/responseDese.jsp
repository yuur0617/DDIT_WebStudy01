<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/responseDesc.jsp</title>
</head>
<body>
	<h4>서버에서 클라이언트로 전송되는 응답 형태 : HttpServletResponse</h4>
    <pre>
        1. Response Line : status code
            status code : 요청 처리의 성공/실패 여부를 표현할 수 있는 세자리 숫자
            
            
            1) 100~ : Http 프로토콜(Connect-Less, State-Less) 
            		  : ING...(진행중), WebSocket 프로토콜에서 사용되고, 주료 양방향 실시간 통신이나 push 메시지 서비스에 활용됨.
            2) 200~ : OK(<%=HttpServletResponse.SC_OK %>)
            3) 300~ : response body가 없기때문에 클라이언트가 응답을 받은후 추가 액션을 행하게 됨.
            	304   : Not Modified(<%=HttpServletResponse.SC_NOT_MODIFIED %>), 캐시영역 검색
            			: 클라이언트가 캐싱해둔 자원이 바뀌어 있는지 요청하고 그 자원이 바뀌지 않았을때
			  302/307 : Moved, 자원의 새로운 위치를 대상으로 새로운 요청을 전송함
			  			: 304에서 바뀐 자원을 전달해줌
						: body가 없고 header로 정보 전달
				=> 바뀐자원에서 계속 자원이 바뀔수도 있다 302
				=> 바뀐자원이 앞으로 바뀔일이 없다. 307     
            -- 실패 --
            4) 400~ : Client side error
            	400	  : <%=HttpServletResponse.SC_BAD_REQUEST %> : 필수 파라미터 누락, 요청 데이터 타입 문제, 요청 데이터 길이가 너무 길때...(요청 검증시 의도적으로 전송)
              401/403 : <%=HttpServletResponse.SC_UNAUTHORIZED %> / <%=HttpServletResponse.SC_FORBIDDEN %> : 보안처리
            	404   : <%=HttpServletResponse.SC_NOT_FOUND %> : 주소가 잘못됬을 경우 , 서버에 클라이언트가 요청한 자원이 없을때
            	405   : <%=HttpServletResponse.SC_METHOD_NOT_ALLOWED %> : callback메소드가 정의되지 않았을 때 
            	406   : <%=HttpServletResponse.SC_NOT_ACCEPTABLE %> 
            			: request Accept header(response Content-Type) 헤더를 처리할수없음
            	415   : <%=HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE %>
            			: request Content-Type 헤더를 처리할수없음 ex)너가 준 편지를 못읽겠다!
            			
            	=> json으로 편지를 적었지만 response가 읽지 못한다. 415
            	=> 편지는 읽을수 있지만 json으로 답장을 보내지 못한다. 406
            5) 500~ : Server side error
            
        2. Response Header (name/value)
            content-*
            content-Lenght : response body의 길이
            content-Type : response body content's MiME
            
            1) Content-Type : response content MIME
            
            2) Cache-Control : 캐시 제어 - 304
            3) Refresh : auto-request
            
            4) Location : 자원의 위치가 새로운 곳으로 이동한 경우, 새로운 위치 정보를 제공하는 헤더(sendRedirect) - 302, 307
        3. Response Body(Content Body, Message Body) : 응답 컨텐츠 영역
    </pre>
</body>
</html>