$(document).on('ajax:success', 'a.vote', function(status, data, xhr) {
  $(".votes-count[data-id=" + data.id + "]").text(data.count);
  $("a.vote[data-id=" + data.id + "]").each(function() {
    var $a, href, text;
    $a = $(this);
    href = $a.attr('href');
    text = $a.text();
    $a.text($a.data('toggle_text')).attr('href', $a.data('toggle_href'));
    $a.data('toggle_text', text).data('toggle_href', href);
  });
});
