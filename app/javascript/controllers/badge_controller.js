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
  submit(e) {
    e.preventDefault();
    e.stopPropagation();

    console.log(`issue_date: ${this.issueDateTarget.value}`);
    console.log(`recipient_name: ${this.recipientNameTarget.value}`);
    console.log(`uuid: ${this.uuidTarget.value}`);

    fetch("/submit", {
      method: "POST",
      body: JSON.stringify(
        {
          issue_date: this.issueDateTarget.value,
          recipient_name: this.recipientNameTarget.value,
          uuid: this.uuidTarget.value
        }
      ),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-CSRF-Token': $.rails.csrfToken() // TODO when jquery-ujs replaced by rails-ujs: Rails.csrfToken()
      }
    }).then(response => {
      console.log(response.body);
      if(response.ok) {
      }
      else {
        console.log(response.body);
        alert("Got an error response from the server")
      }
    }).catch(error => {
      alert(`Error: ${error}`);
    })
  }
}
