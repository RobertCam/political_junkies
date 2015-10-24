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

  $(window).scroll(function(){
   if( $(document).scrollTop() > 580 ) {
      $('.backToTop').show();
   } else {
      $('.backToTop').hide();
   }
  });

});

function makeDonut(target, data)
{
    new Morris.Donut({
    element: target,
    data: [
      {label: "Individual", value: data[0]},
      {label: "PAC", value: data[1]},
      {label: "Total", value: data[2]}
    ],
    resize: true,
    colors: ["#0066FF", "#000066", "#82C4E6"]

  });
}
