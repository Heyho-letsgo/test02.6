json.array!(@uneautrepages) do |uneautrepage|
  json.extract! uneautrepage, :id, :civilite, :prenom, :nom
  json.url uneautrepage_url(uneautrepage, format: :json)
end
