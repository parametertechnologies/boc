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

// Implementation Notes for displaying patient and doctor infowindow's
//
// 1. Extract out _patient.html.erb and _doctor.html.erb partials from:
//  - app/views/patients/show.html.erb
//  - app/views/doctors/show.html.erb
//
// 2. Render partials on to app/views/patients/show.html.erb
//
// 3. Add CSS to hide partial content
//
// 4. Modify Doctor#gps_list to return :gps & :id from pluck
//
// 5. Render into div#map data fields :id and :gps pairs for doctors and patient
//
// 6. Maps.js should attach and show partial content on infowindow with click event
//


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

    for (var index = 0; index < doctors_gps.length; ++index) {
      var selector = "#doctor_" + (index + 1);
      var content = $(selector).html();
      var infowindow = new google.maps.InfoWindow();
      var doctor_marker = new google.maps.Marker({
        position: doctors_gps[index],
        map: map,
        title: 'Doctor'
      });

      google.maps.event.addListener(doctor_marker,'click',
        (function(doctor_marker, content, infowindow){
          return function() {
            infowindow.setContent(content);
            infowindow.open(map, doctor_marker);
          };
      })(doctor_marker, content, infowindow));

    }
  }
}
