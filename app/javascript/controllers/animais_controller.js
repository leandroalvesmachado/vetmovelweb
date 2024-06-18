import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cidadao"]

  connect() {
    $(this.cidadaoTarget).on('change', this.loadAnimais.bind(this))
    this.loadAnimais()
  }

  async loadAnimais() {
    const cidadaoId = this.cidadaoTarget.value;
    const animalSelect = document.querySelector("#animal_id")
    
    if (!cidadaoId) {
      animalSelect.innerHTML = "<option value=''>Escolha a opção</option>"
      return
    }

    try {
      const response = await fetch(`${window.location.origin}/administracao/ajax/cidadaos/${cidadaoId}/animais`)
      const animais = await response.json()

      animalSelect.innerHTML = "<option value=''>Escolha a opção</option>"
      animais.forEach(animal => {
        let option = document.createElement('option')
        option.value = animal.id
        option.textContent = animal.nome
        animalSelect.appendChild(option)
      })
    } catch (error) {
      animalSelect.innerHTML = "<option value=''>Escolha a opção</option>"
    }
  }
}
