//
// Used to draw the google map based on:
//  - The patient: Patient#GPS and doctors/patient info
//  Which is stored in the view:
//  - ./app/views/patient/index.html.erb
//
function initMap() {
  if ($("#map").length) {
    var patient_gps = $("#map").data("patient_gps");

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: patient_gps
    });

    var infowindow = new google.maps.InfoWindow({
      content: $("#patient").html()
    });

    var patient_marker = new google.maps.Marker({
      position: patient_gps,
      icon: {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 5
      },
      map: map,
      title: 'Patient'
    });

    patient_marker.addListener('click', function() {
      infowindow.open(map, patient_marker);
    });

    $("#doctors div").each(function(index, element) {
      var selector = "#" + $(this).attr('id');
      var gps = JSON.parse($(selector + " " + "#gps").html());
      var full_name = $(selector + " " + "#full_name").html();
      var content = $(selector).html();
      var infowindow = new google.maps.InfoWindow();

      var doctor_marker = new google.maps.Marker({
        position: gps,
        map: map,
        title: full_name
      });

      google.maps.event.addListener(doctor_marker,'click',
        (function(doctor_marker, content, infowindow){
          return function() {
            infowindow.setContent(content);
            infowindow.open(map, doctor_marker);
          };
      })(doctor_marker, content, infowindow));

    });
  }
}
