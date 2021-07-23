import { Controller } from "stimulus"
import SHA256 from "sha256";
import chainpoint from 'chainpoint-js/dist/bundle.web'

export default class extends Controller {
  static targets = [
    "issueDate",
    "uuid",
    "recipientName"
  ]

  connect() {}

  // send data to blockchain
  submit() {
    const hash = this.digest(`${this.issueDateTarget.value}${this.recipientNameTarget.value}${ this.uuidTarget.value}`);
    console.log(this.issueDateTarget.value);
    console.log(this.recipientNameTarget.value);
    console.log(this.uuidTarget.value);

    console.log(chainpoint);
    console.log(hash);
  }

  private

  digest(data) {
    return SHA256(data);
  }
}
