require 'sexpistol'

# This method takes the array of symbols/arrays that sexpistol generates and turns it into a hash.
# The value of the keys are nil unless a nested list is detected, in which case, the value is a nested hash.
def sp_array_to_hash(a)
  h = {}
  a.each do |elem|
    if elem.is_a? Array then
      # find the previous array element, which will receive our hash value
      name = a[a.find_index(elem)-1].to_s
      h["#{name}"] = sp_array_to_hash(elem)
    else
      h["#{elem.to_s}"] = nil
    end
  end
  return h
end

str = "(id,created,employee(id,firstname,employeeType(id), lastname),location)"

# remove initial whitespace
str.gsub!(' ', '')

# s expressions use spaces to delimit items
str.gsub!(',', ' ')

@parser = Sexpistol.new
result = @parser.parse_string(str)

h = sp_array_to_hash(result[0])
