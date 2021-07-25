import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "issueDate",
    "uuid",
    "recipientName",
    "blockchain",
    "errorMessage"
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
    console.log(`issue_date: ${this.issueDateTarget.value}`);
    console.log(`recipient_name: ${this.recipientNameTarget.value}`);
    console.log(`uuid: ${this.uuidTarget.value}`);
  }
}
