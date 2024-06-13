class AgendamentoRepository
  def initialize()
    @model = Agendamento
  end

  def paginate(params)
    begin
      query = @model

      if params[:data_inicio].present? && params[:data_fim].present?
        query = query.where(data: params[:data_inicio]..params[:data_fim])
      elsif params[:data_inicio].present?
        query = query.where("data >= ?", params[:data_inicio])
      elsif params[:data_fim].present?
        query = query.where("data <= ?", params[:data_fim])
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
end
