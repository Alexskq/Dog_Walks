import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["test", "modalcard", "modalrefresh"];
  connect() {
    console.log("Modal connected 2");
  }

  close() {
    window.location.reload();
  }
}
