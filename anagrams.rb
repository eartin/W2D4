def build_anagrams(str)
  return [str] if str.length == 1
  anagrams = []
  (0...str.length).each do |i|
      array = build_anagrams(str[0...i]+str[i+1..-1])
      array.each do |e|
        anagrams << str[i] + e  
      end
  end
  anagrams 
end

def first_anagram?(str1, str2)
  build_anagrams(str1).include?(str2)
end

p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)
  (0...str1.length).each do |i|
    idx = str2.index(str1[i])
    if idx
      str2 = str2[0...idx] + str2[idx+1..-1]
    end
  end
  return str2.empty?
end

p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")

def third_anagram?(str1, str2)
  str1.chars.sort.join == str2.chars.sort.join
end

p third_anagram?("gizmo", "sally")
p third_anagram?("elvis", "lives")

def build_hash(str)
  hash = Hash.new(0)
  str.each_char do |ch|
    hash[ch] += 1
  end
  hash
end
def fourth_anagram?(str1, str2)
  build_hash(str1) == build_hash(str2)
end

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
