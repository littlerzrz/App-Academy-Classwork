require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    # ...
    input = params.map {|key,value| "#{key} = ?" }.join(" AND ")

    res = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{input}
    SQL

    res.map! {|attr| self.new(attr) }
  end
end

class SQLObject
  # Mixin Searchable here...
    extend Searchable

end
