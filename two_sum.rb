arr = [0, 1, 5, 7]

def bad_two_sum?(arr, target)
  (0...arr.length-1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  return false
end

# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
    arr.sort!
    (0...arr.length-1).each do |i|
      (i+1...arr.length).each do |j|
        return true if arr[i] + arr[j] == target
        break if arr[i] +arr[j] > target
      end
    end
    return false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target)
  hash = Hash.new { |h,k| h[k] = 0 }
  arr.each do |elem|
    hash[elem] += 1
  end
  arr.each do |elem|
    if target-elem == elem && hash[target-elem] > 1
      return true 
    elsif hash[target-elem] > 0
      return true 
    end
  end
  return false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def twosum?(arr, target)
  hash = Hash.new
  arr.each do |i|
    hash[i] = true
  end

  arr.each do |i|
    remainder = target - i  
      hash[i] = false
      if hash[remainder]
        return true
      end
      hash[i] = true  
  end
  return false  
end

p twosum?(arr, 6) # => should be true
p twosum?(arr, 10) # => should be false
