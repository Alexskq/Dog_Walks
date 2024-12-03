import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    console.log("connected", this.element);
    flatpickr(".datepicker", {
      enableTime: true,
      dateFormat: "d-m-Y",
      minDate: "today",
    });
    flatpickr(".timepicker", {});
  }
}
