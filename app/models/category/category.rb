#module Category
#  class Base
#    #include ActiveModel::Conversion
#    #extend ActiveModel::Naming
#    #
#    #def persisted?
#    #  false
#    #end
#
#    def measurement_class
#      raise "measurement class must be implemented by subclass"
#    end
#  end
#end