$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
    
  end
  total
end

def list_of_directors(source)
list_index = 0
name_in_source = [] 
  while list_index < source.length do
   name_in_source.push(source[list_index][:name])
  list_index += 1
  end
  name_in_source
end

def total_gross(source)
  row_index = 0
  combined_gross = 0

    while row_index < source.length do
    name = list_of_directors(source)[row_index]
      combined_gross += directors_totals(source)[name]

    row_index += 1
  end
  combined_gross
  
end


