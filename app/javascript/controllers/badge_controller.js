import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [
    "issueDate",
    "uuid",
    "recipientName"
  ]

  connect() {}

  // send data to blockchain
  submit() {
    const chainpoint_hash = this.createHash(this.issueDateTarget.value, this.recipientNameTarget.value, this.uuidTarget.value);
    console.log(this.issueDateTarget.value);
    console.log(this.recipientNameTarget.value);
    console.log(this.uuidTarget.value);

    console.log(chainpoint_hash);
  }

  private

  createHash(date, name, uuid) {
    let hash = "<hash here>";

    return hash;
  }
}
