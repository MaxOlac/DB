class Task < ActiveRecord::Base
  def name
    self.task
  end
# Fíjate en la línea anterior como este modelo está heredando de la clase
# ActiveRecord::Base
# Que tanto código te regala ActiveRecord
#Me regala los geters y seters de todos mis atributos

end
