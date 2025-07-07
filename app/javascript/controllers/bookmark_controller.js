import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  async bookmark(event) {
    const button = event.target;
    const mealId = button.getAttribute("data-meal-id");
    
    const response = await fetch("/bookmarks", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      },
      body: JSON.stringify({ meal_id: mealId })
    });

    if (response.ok) {
      button.innerText = "Added to favouirtes"
      button.disabled = true
    } else {
      console.error("Failed to bookmark meal. Please try again.");
    }
  };

  async unbookmark(event) {
    const button = event.target;
    const mealId = button.getAttribute("data-meal-id");
    
    const response = await fetch(`/bookmarks/${mealId}`, {
      method: "DELETE",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    });

    if(response.ok) {
      button.parentElement.remove()
    }
  }
}