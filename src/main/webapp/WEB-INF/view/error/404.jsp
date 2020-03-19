<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다.</title>
<style>

:root {
	font-size: 20px;	
	font-family: 'IBM Plex Mono';
	line-height: 1.5;
	color: rgba(white, 0.25);
}

body {
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	background: #333333;
}

a { color: white; display: inline; }

#error {
	margin-bottom: 1rem;
	
	font-size: 2rem;
	font-weight: 500;
	text-transform: uppercase;
	letter-spacing: 0.075em;
	color: #C94D4D;	
	
	@keyframes pulse { 
		from { opacity: 0.5; } 
		50% { opacity: 0.5; } 
	}
	animation: pulse 4s infinite alternate;
	
	/*  "connection" */
	position: relative;
	&::before {
		content: '';
		width: 0.75rem;
		height: 50vh;
		margin-bottom: 0.75em;
		
		position: absolute;
		left: 50%; bottom: 100%;
		transform: translateX(-50%);

		background: linear-gradient(to bottom,
			rgba(white, 0.1) 60%,
			transparent 100%
		);
	}
}

#desc {
	margin: 2em 0 1em;
}


/*  500 ERROR NUMBER */

.error-num {
	animation: colorSplit 1.25s steps(2, end) infinite;
	position: relative;
	font-size: 10rem;
	font-family: 'Oswald';
	letter-spacing: -0.01em;
	color: white;
	
	@keyframes colorSplit {
		25% { text-shadow: -0.02em 0 0 #ED008C, 0.025em 0 0 #0087EF; }
		75% { text-shadow: -0.035em 0 0 #ED008C, 0.04em 0 0 #0087EF; }
	}
	
}

.error-num__clip {
	@extend .error-num;
	position: absolute;
	/* // left: -2px to cover up the horizontal outline
	// that occurs from overlapping */
	top: 0; left: -2px;
	z-index: 10;
	
	color: #333;
	overflow: visible;
	clip-path: polygon(
		0% 0%, 100% 0, 100% 25%, 0 25%, 
		0 30%, 100% 30%, 100% 50%, 0 50%,
		0 60%, 100% 60%, 100% 65%, 0 65%,
		0 80%, 100% 80%, 100% 85%, 0 85%,
	0% 0%);
	
	@keyframes glitch {
		30% { left: 0; }
		to { left: 0; }
	}
	
	animation: glitch 1s steps(2, start) infinite;	
	
	&::before { 
		content: '500';
		@extend .error-num__clip;
		left: 0.05em;
		color: white;
		z-index: 9;
		
		/* // only way to get rid of pesky
		// vertical outline due to overlapping is
		// making polygon 1% taller */
		clip-path: polygon(
			0% 0%, 100% 0, 100% 26%, 0 26%, 
			0 29%, 100% 29%, 100% 51%, 0 51%,
			0 59%, 100% 59%, 100% 66%, 0 66%,
			0 79%, 100% 79%, 100% 86%, 0 86%,
		0% 0%);
	}
}

.error-num__clip-left {
	@extend .error-num__clip;
}
        
    </style>
</head>
<body>
<div id = "error">Error</div>
<div class="error-num">500</div>
<div class="error-num__clip">500</div>

<p id ="desc">	Uh oh, there seems to be a problem.</p>
<p>Let me help you find <a href='https://codepen.io/' target='_blank'>a way out</a> 
</p>
p 

</body>
</html>