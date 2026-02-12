import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "value"]
  static values = { defaultPeriod: String }

  connect() {
    this.applyPeriod(this.defaultPeriodValue || "monthly")
  }

  switch(event) {
    this.applyPeriod(event.currentTarget.dataset.billingPeriod)
  }

  applyPeriod(period) {
    this.valueTargets.forEach((valueNode) => {
      const nextValue = valueNode.dataset[period]
      if (nextValue) valueNode.textContent = nextValue
    })

    this.buttonTargets.forEach((button) => {
      const isActive = button.dataset.billingPeriod === period
      button.classList.toggle("is-active", isActive)
      button.setAttribute("aria-pressed", isActive ? "true" : "false")
    })
  }
}
