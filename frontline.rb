require 'sexpistol'

str = "(id,created,employee(id,firstname,employeeType(id), lastname),location)"

@parser = Sexpistol.new
result = @parser.parse_string(str)
