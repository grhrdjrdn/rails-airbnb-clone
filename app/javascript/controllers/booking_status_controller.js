import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-status"
export default class extends Controller {
  // static targets = ["deny_button"]

  connect() {
    // console.log("Stimulus is working");
    // console.log(this.element);
    // console.log(this.itemsTarget)
    // console.log(this.deny_buttonTarget)
  }

  send(event) {

    console.log("send invoked")
    const action = event.params.action
    const path = event.params.path
    const target = event.target.parentElement.parentElement.querySelector(".status")
    console.log(action)
    console.log(path)
    console.log(target)

    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(path, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Accept": "application/json"
      }
    })
      .then(response => response.json())
      .then((data) => {
        if (data.status) {
          target.innerText = data.status
          target.parentElement.classList = ""
          target.parentElement.classList.add(data.status)
        }
      })


  }

}
