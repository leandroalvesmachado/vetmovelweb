class AgendamentoDecorator < Draper::Decorator
  delegate_all
  
  def formatted_data
    return object.data.strftime("%d/%m/%Y") if object.data.present?
  end

  def formatted_created_at
    return object.created_at.strftime("%d/%m/%Y %H:%M:%S") if object.created_at.present?
  end
end
