class CidadaoRepository
  def initialize()
    @model = Cidadao
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

      if params[:descricao].present?
        query = query.where("descricao LIKE ?", "%#{params[:descricao]}%")
      end

      return query
    rescue => e
      return @model.none
    end
  end

  def create(attributes)
    begin
      @model.create!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def update(cidadao, attributes)
    begin
      cidadao.update!(attributes)

      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end

  def destroy(cidadao)
    begin
      ActiveRecord::Base.transaction do
        if cidadao.animais.any?
          cidadao.animais.each do |animal|
            animal.imagem.purge if animal.imagem.attached?

            if animal.imagens.attached?
              animal.imagens.each do |imagem|
                imagem.purge
              end
            end

            animal.destroy!
          end
        end
        
        cidadao.destroy!
      end
      return true
    rescue => e
      return "Ocorreu um erro: #{e.message}"
    end
  end
end
