//
// Used to draw the google map based on:
//  - The patient: Patient#GPS
//  Which is stored in a data-gps value in the view:
//  - ./app/views/patient/index.html.erb
//
function initMap() {
  if ($("#map").length) {
    var patient_gps = $("#map").data("patient_gps");
    var doctors_gps = $("#map").data("doctors_gps");

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: patient_gps
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

    patient_marker.setMap(map);

    var index;
    for (index = 0; index < doctors_gps.length; ++index) {
      var doctor_marker = new google.maps.Marker({
        position: doctors_gps[index],
        title: 'Doctor'
      });

      doctor_marker.setMap(map);
    }



  }
}
