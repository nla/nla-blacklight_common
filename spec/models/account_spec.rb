# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id             :bigint           not null, primary key
#  email_2fa_flag :string           default("y")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Account do
  subject(:account) do
    user = create(:user)
    described_class.create(user: user)
  end

  it "belongs to user" do
    expect(account).to belong_to(:user)
  end

  describe "validations" do
    it "validates the existence of a user" do
      expect(account).to be_valid
    end

    it "defines an enum for email 2FA flag" do
      expect(account).to define_enum_for(:email_2fa_flag)
        .with_values(y: "y", n: "n")
        .backed_by_column_of_type(:string)
    end
  end

  context "when user is deleted" do
    it "destroys the account" do
      account.user.destroy
      expect(described_class.count).to eq(0)
    end
  end
end
