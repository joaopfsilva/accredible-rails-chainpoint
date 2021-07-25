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
      console.error("You must set the blockchain service to use. This can be done by setting a data-badge-blockchain attribute with the name of the blockchain in use, on the data-controller element");
    } else {
      this.blockchainTarget.value = this.context.element.dataset.badgeBlockchain;
      console.log(`Current blockchain in use: ${this.context.element.dataset.badgeBlockchain}`);
    }
  }

  submit(e) {
    if( this.context.element.dataset.badgeBlockchain === undefined ) {
      e.stopPropagation();
      e.preventDefault();
      this.errorMessageTarget.innerText = "Server error. Check console";
    } else {
      this.errorMessageTarget.innerText = "";
      console.log(`issue_date: ${this.issueDateTarget.value}`);
      console.log(`recipient_name: ${this.recipientNameTarget.value}`);
      console.log(`uuid: ${this.uuidTarget.value}`);
    }
  }
}
