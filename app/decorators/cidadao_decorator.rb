class CidadaoDecorator < Draper::Decorator
  delegate_all

  def formatted_cpf
    object.cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4') if object.cpf.present?
  end

  def formatted_data_nascimento
    object.data_nascimento.strftime("%d/%m/%Y") if object.data_nascimento.present?
  end

  def formatted_telefone_celular(telefone)
    return unless telefone.present?

    telefone = telefone.gsub(/\D/, '')

    if telefone.length == 11
      "(#{telefone[0..1]}) #{telefone[2..6]}-#{telefone[7..10]}"
    elsif telefone.length == 10
      "(#{telefone[0..1]}) #{telefone[2..5]}-#{telefone[6..9]}"
    else
      telefone
    end
  end

  def formatted_telefone
    formatted_telefone_celular(object.telefone)
  end

  def formatted_telefone_contato
    formatted_telefone_celular(object.telefone_contato)
  end

  def formatted_celular
    formatted_telefone_celular(object.celular)
  end

  def animais
    object.animais.decorate if object.animais.any?
  end
end
