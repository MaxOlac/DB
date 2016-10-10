class User < ActiveRecord::Base
    validates :email, :format => { :with => /\A[^@]+@([^@\.]+\.)+[^@\.]{2,}\z/,:message => "email like ejemplo@mail.com" }
    validates :email, :uniqueness => true
    validates :phone, :format => { :with => /\A.*([0-9]+.*){10,}\z/,:message => "email like ejemplo@mail.com" }
    validate :olderThan
  
  def name

    "#{self.first_name} #{self.last_name}"
  end 

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  def olderThan
    
    errors.add(:birthday,"need 18") if birthday.year > 1998
  end

end


