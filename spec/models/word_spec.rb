require 'rails_helper'

RSpec.describe Word, type: :model do
  context "validations" do
    it { should validate_presence_of(:trad) }
    it { should validate_presence_of(:simp) }
    it { should validate_presence_of(:pinyin) }
    it { should validate_presence_of(:definition) }
  end
end
