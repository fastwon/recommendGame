<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/index.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript">
	$(function() {
			let gameCount = 0;
			
			let page = 0;
			for (var i = 0; i < 50; i++) {
				page = page + 1;
				$.ajax({
					url: "https://api.rawg.io/api/games?key=c7837645acdf417d821ec524ef5c86e9&page=" + page,
					
					success: function(showGenre) {
						$.each(showGenre.results, function(i2, s) {
							if(gameCount >= 5) {
								return false;
							}
							let genreTd2 = " ";
							for (var j2 = 0; j2 < s.genres.length; j2++) {
								genreTd2 = genreTd2 + s.genres[j2].name + " . ";
							}
							
							if (genreTd2.includes("${param.gameGenres}")) {
								let img = $("<img>").attr("src", s.background_image);
								let td = $("<td></td>").append(img);
								let aa1 = $("<a></a>").text(s.name).attr("href", "https://www.youtube.com/results?search_query=" + s.name);
								let td2 = $("<td></td>").append(aa1);
								let tr2 = $("<tr></tr>").append(td, td2);
								$(".rTable").append(tr2);
								
								gameCount++;
								
								return true;
							}
							
							
						});
					}
				});
			}
	});
</script>
</head>
<body>
	<table id="mTable">
		<th><a href="/nov041/">Recommend You Game</a></th>
		<tr>
			<td id="gnTd">
				Your game : ${param.gameName }
			</td>
		</tr>
	</table>
	<table class="rTable">
	
	</table>
</body>
</html>