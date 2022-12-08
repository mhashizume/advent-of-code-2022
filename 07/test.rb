require 'debug'

location = ['/', 'a']
filesystem = {"/"=>{"b.txt"=>14848514, "c.dat"=>8504156, "a"=>{}}}


def recursive_thing(input_array, input_hash)
  input_location = input_array.dup
  if input_hash.is_a?(Hash) && value != nil || {}
    input_hash.each do |key, value|
        binding.break
        dir = input_location.delete_at(0)
        recursive_thing(input_location, value.dig(dir))
      else
        puts value
      end
    end
  elsif 
  
 end
  input_hash.each do |key, value|
    if value.is_a?(Hash) && value != nil || {}
      binding.break
      dir = input_location.delete_at(0)
      recursive_thing(input_location, value.dig(dir))
    else
      puts value
    end
  end
end

recursive_thing(location, filesystem)