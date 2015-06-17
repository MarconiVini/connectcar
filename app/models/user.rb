class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :cpf,  uniqueness: true
  has_many :devices
  belongs_to :plan

  def formated_cpf
    self.cpf.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
  end

  def debit(value)
    validate_minimum_balance(value)
    self.account_balance = account_balance - value.to_d
    self.save
    self.account_balance
  end

  def credit(value)
    self.account_balance = account_balance + value.to_d
    self.save
    self.account_balance
  end

  def validate_minimum_balance(value)
    if self.account_balance - value < 0.0
      errors.add(:account_balance, "")
    end
  end
end
