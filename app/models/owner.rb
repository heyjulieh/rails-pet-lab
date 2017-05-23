class Owner < ActiveRecord::Base
  # TODO: add association ot pets
    has_many :pets, dependent: :destroy

  # TODO: add association to appointments (through pets)

  # TODO: add validations
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}
  validates_format_of :email, :with => /@/
  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    if phone.present?
     phone.gsub!(/^1/, "")
     phone.gsub!(/[()-.]/,"")
   end
    # stretch
  end

end
