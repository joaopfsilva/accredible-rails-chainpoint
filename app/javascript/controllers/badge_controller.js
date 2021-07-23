import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "issueDate",
    "uuid",
    "recipientName",
    "blockchain"
  ]

  connect() {
    // set blockchain in use
    if( this.context.element.dataset.badgeBlockchain === undefined ) {
      console.error("You must define the blockchain service in use. On the same element of the data-controller add data-badge-blockchain with the value");
    } else {
      this.blockchainTarget.value = this.context.element.dataset.badgeBlockchain;
      console.log(`Current blockchain in use: ${this.context.element.dataset.badgeBlockchain}`);
    }
  }

  // send data to chainpoint blockchain
  submit(event) {
    console.log(this.issueDateTarget.value);
    console.log(this.recipientNameTarget.value);
    console.log(this.uuidTarget.value);

    event.stopPropagation();

    // fetch("/submit", {
    //   method: "POST",
    //   body: JSON.stringify(
    //     {
    //       issue_date: this.issueDateTarget.value,
    //       recipient_name: this.recipientNameTarget.value,
    //       uuid: this.uuidTarget.value
    //     }
    //   ),
    //   headers: {
    //     'Accept': 'application/json',
    //     'Content-Type': 'application/json',
    //     'X-CSRF-Token': $.rails.csrfToken() // TODO when jquery-ujs replaced by rails-ujs: Rails.csrfToken()
    //   }
    // }).then(response => {
    //   console.log(response);
    //   if(response.ok) {
    //   }
    //   else {
    //     alert("Got an error response from the server")
    //   }
    // }).catch(error => {
    //   alert('Error updating order')
    // })
  }
}
