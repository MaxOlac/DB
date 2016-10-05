class Meal < MiniActiveRecord::Model
  
  def self.all

    super(self,"meals")
  end
  

  def self.create(attributes)

    super(attributes,self)
  end

  def self.where(query, *args)

   super(query,*args,self,"meals")
  end
  #probado
  def self.find(pk)

    super(pk,self)
  end

  self.attribute_names = [:id, :name, :chef_id, :created_at, :updated_at]

  attr_reader :attributes, :old_attributes

  def initialize(attributes = {})

       super(attributes,Meal.attribute_names)
  end

  def chef

    Chef.where('id = ?', self[:chef_id])
  end

  def chef=(chef)
    self[:chef_id] = chef[:id]
    self.save

    chef
  end
  #probado
  def new_record?

    super(self)
  end
 
  private
  #probado
  def insert!

    super(self,'meals')
  end
  #probado
  def update!

    super(self,'meals')
  end
end
