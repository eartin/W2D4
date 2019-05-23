list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_phase_1(arr)
  (0...arr.length).each do |idx1|
    is_larger = true
    (idx1+1...arr.length).each do |idx2|
      if arr[idx2] < arr[idx1]
        is_larger = false
      end
    end
    if is_larger
      return arr[idx1]
    end
  end
end


def my_min_phase_2(arr)
  smallest = arr[0]
  (1...arr.length).each do |idx|
    smallest = arr[idx] if arr[idx] < smallest
  end
  smallest
end


def largest_contiguous_subsum_phase1(arr)
  list = []
  (0...arr.length).each do |i|
    (1..arr.length-i).each do |j|
      list << arr.slice(i,j)
    end
  end
  sums = list.map { |sub| sub.sum }
  sums.max
end


def largest_contiguous_subsum_phase2(arr)
  max = arr[0]
  (1...arr.length).each do |i|
    if arr[i] >= 0
      max += arr[i]
    elsif max < 0 and max < arr[i]
      max = arr[i]
    end

  end
  max
end

list = [-5, -1, -3]
p largest_contiguous_subsum_phase2(list) # => -1 (from [-1])