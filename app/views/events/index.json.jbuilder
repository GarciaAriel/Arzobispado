json.array!(@events) do |event|
  json.id event.id
  json.title event.nombre
  json.description event.descripcion
  json.start event.fecha_inicio
  json.end event.fecha_fin
  json.url event_url(event)
end