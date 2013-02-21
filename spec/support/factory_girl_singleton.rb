module FactoryGirl

  class Singleton
    @@singletons = {}

    def self.execute(factory_key)
      @@singletons[factory_key] ||= FactoryGirl.create(factory_key)
    end

    def self.single
      @@singletons
    end
  end

end