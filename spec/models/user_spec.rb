require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    let(:user) { create(:user) }

    it "does not allow a duplicate record" do
      expect(user.dup).not_to be_valid
    end
  end
end
