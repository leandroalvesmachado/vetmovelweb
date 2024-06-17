import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cidadao"]

  connect() {
    this.loadAnimais()
  }

  async loadAnimais() {
    const cidadaoId = document.querySelector("#cidadao_id")
    const animalSelect = document.querySelector("#animal_id")
    
    if (!cidadaoId) {
      animalSelect.innerHTML = "<option value=''>Escolha a opção</option>"
      return
    }

    console.log(cidadaoId);

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
