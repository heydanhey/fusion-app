json.array! @players do |player|
  json.id player.id
  json.name player.name
  json.team player.team
  json.position player.position
end