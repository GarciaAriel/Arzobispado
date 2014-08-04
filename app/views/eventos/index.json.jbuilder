json.array!(@eventos) do |evento|
  json.id evento.id
  json.title evento.nombre
  json.description evento.descripcion
  json.start evento.fecha_inicio
  json.end evento.fecha_fin
  json.url evento_url(evento)
end