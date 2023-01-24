<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecommendYouGame</title>
<link rel="stylesheet" href="resources/css/index.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/FastValidChecker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#mBtn").click(function() {
			$(".rTable").empty();
			let gameNameInput = document.getElementById("gameName1");
			
			if (atLeastLetter(gameNameInput, 3)) {
				alert("You Should Write At Least 3 Letter.");
				gameNameInput.focus();
				return false;
			}
			
			let page = 0;
			for (var i = 0; i < 1000; i++) {
				page = page + 1;
				$.ajax({
					url: "https://rawg-video-games-database.p.rapidapi.com/games?key=c7837645acdf417d821ec524ef5c86e9&page=" + page,
					headers: {
						"X-RapidAPI-Key": "7183360185msh7ec1a0fef9ab6b8p110dc7jsn400643c13c1e",
						"X-RapidAPI-Host": "rawg-video-games-database.p.rapidapi.com"
					},
					success: function(showGenre) {
						let iVal = $("input").val();
	
						$.each(showGenre.results, function(i2, s) {
							if (s.name.toLowerCase().includes(iVal.toLowerCase())) {
								let img = $("<img>").attr("src", s.background_image);
								let td = $("<td></td>").append(img);
								let aa1 = $("<a></a>").text(s.name).attr("href", "https://www.youtube.com/results?search_query=" + s.name);
								let td2 = $("<td></td>").append(aa1);
								let genreTd = " ";
								for (var j = 0; j < s.genres.length; j++) {
									genreTd = genreTd + s.genres[j].name + " . ";
								}
								let td3 = $("<td></td>").text(genreTd);
								let aa2 = $("<a><button>FindGame</button></a>").attr("href", "recommend.do?gameName=" + s.name + "&gameGenres=" + genreTd);
								let td4 = $("<td></td>").append(aa2);
								let tr = $("<tr></tr>").append(td, td2, td3, td4);
								$(".rTable").append(tr);
								return true;
							}
							
						});
						
					}
				});
			}
			alert("success!");
		});
	});
</script>
</head>
<body>
	<table id="mTable">
		<th colspan="2">Recommend You Game</th>
		<tr>
			<td id="td1" colspan="2" align="center">
				write your game name, then we recommend you some similar games.
			</td>
		</tr>
		<tr id="tr2">
			<td align="right">
				"please write your game"
			</td>
		
			<td align="left">
				<input id="gameName1"> <button id="mBtn"">recommend</button>
			</td>
		</tr>
	</table>
	<table id="nTable">
		<tr>
			<td width="250px">Thumbnail</td>
			<td>Name</td>
			<td>Genres</td>
			<td width="100px">Go!</td>
		</tr>
	</table>
		<table class="rTable">
		</table>
</body>
</html>