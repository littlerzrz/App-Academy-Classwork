require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  def self.columns
    # ...
    return @columns if @columns

    cols = DBConnection.execute2(<<-SQL).first
    SELECT
      *
    FROM
      "#{self.table_name}"
    LIMIT 0
    SQL

    cols.map!{ |ele| ele.to_sym }
    @columns = cols
  end

  def self.finalize!
    cols = self.columns
    
    cols.each do |col|
      define_method(col) do 
        attributes[col]
      end
      
      define_method("#{col}=") do |val|
        attributes[col] = val
      end
    end
  end

  def self.table_name=(table_name)
    # ...
     @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.to_s.tableize
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    self.parse_all(results)

  end

  def self.parse_all(results)
    # ...
    res = []
    results.each do |attributes|
      res << self.new(attributes)
    end
    res
  end

  def self.find(id)
    # ...
    res = DBConnection.execute(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = #{id}
    SQL
    return nil if res.nil?
    self.new(res)
  end

  def initialize(params = {})
    # ...
      cols = self.class.columns
      params.each do |attr_name, val|
        attr_sym = attr_name.to_sym
        raise "unknown attribute '#{attr_name}'" if !cols.include?(attr_sym)
        self.send("#{attr_name}=", val)
      end
    
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
    arr = []
    self.class.columns.map do |col|
      mthd = col.to_sym
      arr << self.send(mthd)
    end
    arr
  end

  def insert
    # ...
    cols = self.class.columns.drop(1)
    col_names = cols.join(",")
    question_marks = Array.new(cols.count) { "?" }.join(",") 
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    cols = self.class.columns.drop(1)
    col_setting = cols.map {|col| "#{col} = ?"}.join(",")

    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE
        #{self.class.table_name} 
      SET
        #{col_setting}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
    if id.nil?
      insert
    else
      update
    end
  end
end
