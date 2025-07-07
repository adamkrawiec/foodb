require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "validations" do
    let(:bookmark) { create(:bookmark) }

    it "does not allow a duplicate record" do
      expect(bookmark.dup).not_to be_valid
    end
  end
end
