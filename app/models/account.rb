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
class Account < PatronsRecord
  belongs_to :user, strict_loading: true

  enum email_2fa_flag: {y: "y", n: "n"}

  validates :email_2fa_flag, inclusion: {in: Account.email_2fa_flags.keys, message: "must be one of #{Account.email_2fa_flags.keys.join(", ")}"}
end
