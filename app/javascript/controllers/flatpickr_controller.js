import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    // console.log("connected", this.element);gst
    flatpickr(".datepicker", {
      enableTime: true,
      dateFormat: "d-m-Y",
      minDate: "today",
      locale: {
        firstDayOfWeek: 1,
        weekdays: {
          shorthand: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"],
          longhand: [
            "Dimanche",
            "Lundi",
            "Mardi",
            "Mercredi",
            "Jeudi",
            "Vendredi",
            "Samedi",
          ],
        },
        months: {
          shorthand: [
            "Jan",
            "Fév",
            "Mar",
            "Avr",
            "Mai",
            "Juin",
            "Juil",
            "Août",
            "Sept",
            "Oct",
            "Nov",
            "Déc",
          ],
          longhand: [
            "Janvier",
            "Février",
            "Mars",
            "Avril",
            "Mai",
            "Juin",
            "Juillet",
            "Août",
            "Septembre",
            "Octobre",
            "Novembre",
            "Décembre",
          ],
        },
      },
    });
    //   flatpickr(".timepicker", {});
  }
}
