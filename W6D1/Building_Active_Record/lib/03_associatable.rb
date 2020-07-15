require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    self.class_name.constantize
  end

  def table_name
    # ...
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
      @foreign_key = "#{name}Id".underscore.to_sym
      @primary_key = :id
      @class_name = "#{name}".singularize.camelcase
      
      if !options.empty?
        options.each do |k, v|
          self.send("#{k}=", v) 
        end
      end
    # ...
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    @foreign_key = "#{self_class_name}Id".underscore.to_sym
    @primary_key = :id
    @class_name = "#{name}".singularize.camelcase

    if !options.empty?
      options.each do |k, v|
        self.send("#{k}=", v) 
      end
    end

      # Option
      # belongs_to :owner,
      # foreign_key: :owner_id,
      # primary_key: : n ,
      # class_name: :Owner

      # Owner 
      # has_many :options,
      # foreign_key: :owner_id,
      # primary_key: :id,
      # class_name: :Option

  end
end


module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    options = BelongsToOptions(name, options)
    define_method(name) do 
      foreign = options.send(:foreign_key)
      options
        .model_class
        .where("options.primary_key = ?", foreign)
        .first
    end

  end

  def has_many(name, options = {})
    # ...
    options = HasManyOptions(name, options)
    define_method(name) do 
      primary = options.send(:primary_key)
      options
        .model_class
        .where("options.primary_key = ?", primary)
        .first
    end

  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
end
