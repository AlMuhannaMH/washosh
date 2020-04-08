$(() => {
  $(".vote").on("click", ".upvote, .downvote", () => {
    let post_id = $(this).parent().data("id"), is_upvote = $(this).hasClass("upvote");

    $.ajax({
      url: "/post/vote",
      method: "POST",
      data: { post_id: post_id, upvote: is_upvote },
      success: () => {console.log("success..");}
    });
  });
});