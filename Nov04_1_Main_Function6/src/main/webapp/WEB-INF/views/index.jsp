<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "https://rawg-video-games-database.p.rapidapi.com/genres?key=8e01828f8e074725813e95b78961dcf1",
			headers: {
				"X-RapidAPI-Key": "7183360185msh7ec1a0fef9ab6b8p110dc7jsn400643c13c1e",
				"X-RapidAPI-Host": "rawg-video-games-database.p.rapidapi.com"
			},
			success: function(showGenre) {
				// alert(JSON.stringify(showGenre));
				
				$.each(showGenre.results, function(i, s) {
					if (s.games[i].name.includes("")) {
						
					}
				});
				
				/* $.each(showGenre.results, function(i, s) {
					let td = $("<td rowspan=\"5\"></td>").text(i + " - " + s.name + " - ");
					let tr = $("<tr></tr>").append(td);
					$("table").append(tr);
					for (var j = 0; j < 4; j++) {
						let td2 = $("<td></td>").text(j + " - " + s.games[j].name);
						tr = $("<tr></tr>").append(td2);
						$("table").append(tr);
					};
					
				}); */
				
			}
		});
	});
</script>
</head>
<body>
	<table border="1"></table>
</body>
</html>