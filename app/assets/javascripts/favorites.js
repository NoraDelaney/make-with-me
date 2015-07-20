// $(document).on('ajax:success', 'a.vote', function(status, data, xhr) {
//   $(".votes-count[data-id=" + data.id + "]").text(data.count);
//   $("a.vote[data-id=" + data.id + "]").each(function() {
//     var $a, href, text;
//     $a = $(this);
//     href = $a.attr('href');
//     text = $a.text();
//     $a.text($a.data('toggle_text')).attr('href', $a.data('toggle_href'));
//     $a.data('toggle_text', text).data('toggle_href', href);
//   });
// });


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
    debugger;
    $(".vote").attr("href", new_url)
    debugger;
    $(".votes-count").text(votes.count);
    });

  });
});
