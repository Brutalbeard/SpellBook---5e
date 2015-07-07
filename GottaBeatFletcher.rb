class Spell
  
  attr_reader :name, :level, :school, :casting_time, :range, :components, :concentration, :duration, :description
  
  def initialize()#name,level, school, casting_time, range, components, concentration, duration, description)
    #@name = name
    #@level = level
    #@school = school
    #@casting_time = casting_time
    #@range = range
    #@components = components
    #@duration = duration
    #@description
  end
  
  def set_name(name)
    @name = name
  end
  
  def set_level(level)
    @level = level
  end
  
  def set_school(school)
    @school = school
  end
  
  def set_casting_time(casting_time)
    @casting_time = casting_time
  end
  
  def set_range(range)
    @range = range
  end
  
  def set_components(components)
    @components = components
  end
  
  def set_concentration(concentration)
    @concentration = concentration
  end
  
  def set_duration(duration)
    @duration = duration
  end
  
  def set_description(description)
    @description = description
  end
  
  def show_info()
    puts "Name: <#{@name}> "#{}Level: <#{@level}> School: <#{@school}> Cast Time: <#{@casting_time}> Range: <#{@range}> Components: <#{@components}> Concentration: <#{@concentration}> Duration: <#{@duration}> Description: <#{@description}>"
  end
end

file_contents = []

open('spell_test.txt', 'r')
file_contents = IO.read('spell_test.txt')

split_up = file_contents.split("\n")

(0..split_up.length).each do |i|
  split_up[i].to_s
end

one = Spell.new

one.set_name(split_up[0])

def search_school(array)
  
  if array.match(/(conjuration)/i) != nil
    return "Conjuration"
  end
  
  if array.match(/(abjuration)/i) != nil
    return "Abjuration"
  end
  
  if array.match(/(transmutation)/i) != nil
    return "Transmutation"
  end
  
end

def search_level(array)
  if array.match(/(cantrip)/i) != nil
    return "Cantrip"
  end
  if array.match(/(1st|1 st)/i) != nil
    return "1st level"
  end
  if array.match(/(2nd|2 nd)/i) != nil
    return "2nd level"
  end
  if array.match(/(3rd|3 rd)/i) != nil
    return "3rd level"
  end
end

def search_casting_time(array_in)
  
  array = array_in[0..array_in.length]
  
  range = array.index('Range:')
  
  array[range..array.length] = ''
  array[0..13] = ''
  return array
  
end

def search_range(array_in)
  
  array = array_in[0..array_in.length]
  
  range = array.index('Range:')
  range += 6
  components = array.index('Components:')
  
  array[components..array.length] = ''
  array[0..range] = ''
  return array
  
end

def search_components(array_in)
  
  array = array_in[0..array_in.length]
  
  components = array.index('Components:' )
  components += 11
  duration = array.index('Duration:')
  
  array[duration..array.length] = ''
  array[0..components] = ''
  return array
  
end

def search_concentration(array)
  
  if array.match(/concentration/i) != nil
    return "Concentraton"
  else
    return 
  end
  
end

def search_duration(array_in)
  
  array = array_in[0..array_in.length]
  
  duration = array.index('Duration:')
  duration += 9
  
  array[0..duration] = ''
  return array
  
end

  
  
  #case array
   # when array.match(/(V, S)/i) != nil then return ["Verbal", "Somatic"]
  #  when array.match(/(instantaneous)/i) != nil then return "Instantaneous"
   # else return false
#  end
  
one.set_description(split_up[3..split_up.length])

one.set_school(search_school(split_up[1]))

one.set_level(search_level(split_up[1]))

one.set_components(search_components(split_up[2]))

one.set_concentration(search_concentration(split_up[2]))

one.set_range(search_range(split_up[2]))

one.set_casting_time(search_casting_time(split_up[2]))

one.set_duration(search_duration(split_up[2]))

puts one.name
puts one.casting_time
puts one.school
puts one.level
puts one.components
puts one.concentration
puts one.range
puts one.duration
puts one.description