# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, "\\1en"
#   inflect.singular /^(ox)en/i, "\\1"
#   inflect.irregular "person", "people"
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym "RESTful"
# end

ActiveSupport::Inflector.inflections(:'pt-BR') do |inflect|
  inflect.irregular 'especie', 'especies'
  inflect.irregular 'pelagem', 'pelagens'
  inflect.irregular 'regional', 'regionais'
  inflect.irregular 'animal_sexo', 'animais_sexos'
end

# Para garantir que funcione no ambiente padrão (se 'pt-BR' não estiver configurado corretamente)
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'especie', 'especies'
  inflect.irregular 'pelagem', 'pelagens'
  inflect.irregular 'regional', 'regionais'
  inflect.irregular 'animal_sexo', 'animais_sexos'
end
