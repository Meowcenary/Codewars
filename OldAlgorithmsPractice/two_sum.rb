def two_sum(target=nil, array=nil)
  if target.nil? || array.nil?
    return 'Target value AND array cant be nil'
  end

  array.each do |val|
    if val < target
      compliment = target - val
      if array.include?(compliment)
        return "values at\nindex1: #{array.index(val)}\nindex2: #{array.index(compliment)}\nadd to target: #{target}"
      end
    end
  end
end

#write some tests for this
