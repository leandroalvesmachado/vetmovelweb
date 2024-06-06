class AnimalRepository
  def initialize()
    @model = Animal
  end

  def all
    return @model.all
  end

  def paginate(params)
    begin
      query = @model

      if params[:nome].present?
        query = query.where("nome LIKE ?", "%#{params[:nome]}%")
      end

      return query
    rescue => e
      return @model.none
    end
  end

  def create(cidadao, attributes)
    begin
      attributes_with_cidadao = attributes.merge(cidadao_id: cidadao.id)
      @model.create!(attributes_with_cidadao)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def update(cidadao, animal, attributes)
    begin
      attributes_with_cidadao = attributes.merge(cidadao_id: cidadao.id)
      animal.update!(attributes_with_cidadao)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(animal)
    begin
      animal.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def select_option_castrado()
    begin
      castrado = [['Escolha a opção', ''], ['Sim', 1], ['Não', 0]]
      options = castrado.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end

  def select_option_obito()
    begin
      obito = [['Escolha a opção', ''], ['Sim', 1], ['Não', 0]]
      options = obito.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
