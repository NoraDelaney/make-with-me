$(function () {
  $(".vote").click(function() {
    var url = $(this).attr("href");

    $.ajax({
      method: "PUT",
      url: url,
      dataType: "json"
    })

    .done(function(votes) {
      var new_url = url.split("/");
      new_url.pop();
      if ($(".vote").text() == "Undo") {
      $(".vote").text("Favorite");
      new_url.push("like");
    } else {
      $(".vote").text("Undo");
      new_url.push("dislike");
    }
    new_url = new_url.join("/");
    $(".vote").attr("href", new_url)
    $(".votes-count").text(votes.count);
    });
  });
});
