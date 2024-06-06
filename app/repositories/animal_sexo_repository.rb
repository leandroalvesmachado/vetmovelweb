class AnimalSexoRepository
  def initialize()
    @model = AnimalSexo
  end

  def select_option()
    begin
      animais_sexos = @model.order(:nome).pluck(:nome, :id)
      animais_sexos.unshift(['Escolha a opção', nil])
      options = animais_sexos.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
