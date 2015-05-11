class Growl
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String

  embeds_many :comments
  embedded_in :user
end
