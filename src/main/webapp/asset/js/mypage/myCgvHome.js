/**
 * 
 */
function mypageDetailClick(e){
	if(e.currentTarget.id === "myCgvHome_movie"){
		location.href = contextPath + "/myCgvHome_movie.me";
	}else if(e.currentTarget.id === "myCgvHome_review"){
		location.href = contextPath + "/myCgvHome_review.me?tab=writtenReviews";
	}
}