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

      if params[:rga].present?
        query = query.where("rga LIKE ?", "%#{params[:rga]}%")
      end

      if params[:nome].present?
        query = query.where("nome LIKE ?", "%#{params[:nome]}%")
      end

      if params[:castrado].present?
        query = query.where(castrado: params[:castrado])
      end

      if params[:obito].present?
        query = query.where(obito: params[:obito])
      end

      if params[:sexo].present?
        query = query.where(sexo: params[:sexo])
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

  def create_image(animal, imagem, imagens)
    begin
      if !imagem.nil?
        animal.imagem.purge if animal.imagem.attached?
        extensao = File.extname(imagem.original_filename).downcase
        nome_imagem = "imagem_#{SecureRandom.uuid}#{extensao}"
        animal.imagem.attach(io: imagem, filename: nome_imagem)
      end

      if imagens.present? && imagens.reject(&:blank?).any?
        imagens.reject(&:blank?).each_with_index do |imagem, index|
          extensao = File.extname(imagem.original_filename).downcase
          nome_imagem = "imagens_#{SecureRandom.uuid}#{extensao}"
          animal.imagens.attach(io: imagem, filename: nome_imagem)
        end
      end
      
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
      animal.imagem.purge if animal.imagem.attached?

      if animal.imagens.attached?
        animal.imagens.each do |imagem|
          imagem.purge
        end
      end
      
      animal.destroy!

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def select_option_castrado()
    begin
      castrado = [['Escolha a opção', ''], ['Sim', true], ['Não', false]]
      options = castrado.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end

  def select_option_obito()
    begin
      obito = [['Escolha a opção', ''], ['Sim', true], ['Não', false]]
      options = obito.to_h

      return options
    rescue => e
      return [[e.message, nil]]
    end
  end
end
