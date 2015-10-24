$(document).ready(function() {
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.Count').each(function () {
    var $this = $(this);
    jQuery({ Counter: 0 }).animate({ Counter: $this.text() }, {
      duration: 3000,
      easing: 'swing',
      step: function () {
        $this.text((this.Counter).toFixed(2));
      }
    });
  });

});
