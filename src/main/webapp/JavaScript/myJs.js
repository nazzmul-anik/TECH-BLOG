function doLike(postId, userId){
    console.log("post id = "+postId+", user id = "+userId);

    const d = {
        postId: postId,
        userId: userId,
        operation: "like"
    }
    $.ajax({
        url: "likePost",
        data: d,
        success: function (data, textStatus, jqXHR){
            if(data.trim() == "createLike"){
                let likeCount = $("#like-counter-"+postId).html();
                likeCount++;
                $("#like-counter-"+postId).html(likeCount);
            }
            if(data.trim() == "deleteLike"){
                let likeCount = $("#like-counter-"+postId).html();
                if(likeCount>0){
                    likeCount--;
                }
                $("#like-counter-"+postId).html(likeCount);
            }
        },
        error: function (jqXHR, textStatus, errorThrown){
        }
    });
}