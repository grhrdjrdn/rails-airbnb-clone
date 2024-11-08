import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startDate", "endDate", "bookedDates"]


  connect() {
    console.log("hello from datepicker controller")
    const bookedDatesArray = JSON.parse(this.bookedDatesTarget.dataset.bookedDates)
    console.log(bookedDatesArray)
    flatpickr(this.startDateTarget, { minDate: "today", disable: bookedDatesArray })
    flatpickr(this.endDateTarget, { minDate: "today", disable: bookedDatesArray })
  }

}
