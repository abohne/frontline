require 'sexpistol'

str = "(id,created,employee(id,firstname,employeeType(id), lastname),location)"

# remove initial whitespace
str.gsub!(' ', '')

# s expressions use spaces to delimit items
str.gsub!(',', ' ')

@parser = Sexpistol.new
result = @parser.parse_string(str)
