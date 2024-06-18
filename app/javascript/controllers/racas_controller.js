import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["especie"]

  connect() {
    this.loadRacas();
  }

  async loadRacas() {
    const especieId = this.especieTarget.value
    const racaSelect = document.querySelector("#raca_id")

    if (!especieId) {
      racaSelect.innerHTML = "<option value=''>Escolha a opção</option>"
      return
    }

    try {
      const response = await fetch(`${window.location.origin}/administracao/ajax/especies/${especieId}/racas`)
      const racas = await response.json()

      racaSelect.innerHTML = "<option value=''>Escolha a opção</option>"
      racas.forEach(raca => {
        let option = document.createElement('option')
        option.value = raca.id
        option.textContent = raca.nome
        racaSelect.appendChild(option)
      })
    } catch (error) {
      racaSelect.innerHTML = "<option value=''>Escolha a opção</option>"
    }
  }
}
