import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { songId: Number }

  submit(event) {
    const rating = event.params.value

    fetch(`/songs/${this.songIdValue}/ratings`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ rating: rating })
    })
  }
}
