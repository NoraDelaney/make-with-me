$(function () {
  $(".vote").click(function() {
    var url = $(this).attr("href");

    $.ajax({
      method: "PUT",
      url: url,
      dataType: "json"
    })

    .done(function(votes) {
      var newUrl = url.split("/");
      newUrl.pop();
      if ($(".vote").text() == "Undo") {
      $(".vote").text("Favorite");
      newUrl.push("like");
    } else {
      $(".vote").text("Undo");
      newUrl.push("dislike");
    }
    newUrl = newUrl.join("/");
    $(".vote").attr("href", newUrl);
    $(".votes-count").text(votes.count);
    });
  });
});
