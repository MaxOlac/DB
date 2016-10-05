class Chef < MiniActiveRecord::Model

  def self.all

    super(self,"chefs")
  end

  def self.create(attributes)

    super(attributes,self)
  end

  def self.where(query, *args)

    super(query,*args,self,"chefs")
  end

  def self.find(pk)

    super(pk,self)
  end

  self.attribute_names = [:id, :first_name, :last_name, :email, :phone,
                          :birthday, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  def initialize(attributes = {})

    super(attributes,Chef.attribute_names)
  end

  def new_record?

    super(self)
  end

  def meals
    Meal.where('chef_id = ?', self[:id])
  end

  def add_meals(meals)
    meals.each do |meal|
      meal.chef = self
    end

    meals
  end


  private
  #probado
  def insert!

    super(self,"chefs")
  end
  #probado
  def update!

    super(self, 'chefs')
  end
end
