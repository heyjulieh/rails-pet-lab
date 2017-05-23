require 'rails_helper'

RSpec.describe Pet, type: :model do
  let (:owner) do
    Owner.create({ first_name: "John", last_name: "Doe", email: "john@doe.com", phone: "234-567-8901"})
  end
  subject (:pet) do
    age = 37.0
    Pet.create({name: "Fluffy", breed: "gerbil"})
  end

  describe Pet do

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of(:breed) }
  end

end
