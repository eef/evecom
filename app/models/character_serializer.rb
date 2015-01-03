class CharacterSerializer < ActiveModel::Serializer
  attributes :character_id, :character_name, :corporation_id, :corporation_name
end