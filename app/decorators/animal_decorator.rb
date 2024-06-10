class AnimalDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def decorated_cidadao
    object.cidadao.decorate
  end

  def formatted_data_nascimento
    return object.data_nascimento.strftime("%d/%m/%Y") if object.data_nascimento.present?
  end

  def idade
    if object.data_nascimento.present?
      hoje = Date.today
      nascimento = object.data_nascimento.to_date
      idade = hoje.year - nascimento.year
      idade -= 1 if hoje.month < nascimento.month || (hoje.month == nascimento.month && hoje.day < nascimento.day)
      
      return idade
    else
      ""
    end
  end

  def formatted_created_at
    return object.created_at.strftime("%d/%m/%Y %H:%M:%S") if object.created_at.present?
  end
end
