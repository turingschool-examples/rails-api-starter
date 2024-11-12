require 'rails_helper'

RSpec.describe Tea do
  describe "validations" do
    it { should have_many :subscriptions }
  end
end