require 'ohm'
class Url < Ohm::Model
  attribute :uuid
  attribute :url

  index :uuid
  index :url
end
