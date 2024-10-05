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
            if(data.trim() == "true"){
                let likeCount = $(".like-counter").html();
                likeCount++;
                $(".like-counter").html(likeCount);
            }
        },
        error: function (jqXHR, textStatus, errorThrown){
        }
    });
}