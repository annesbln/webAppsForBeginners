#method
def add(a, b)
  a + b
end

#simple block (not often used like that)
add_block = ->(a, b) { a + b }
add_block.call(1, 2)

#every method can take one more parameter
#it is optional and it is a block
def adding(a, b, &c)
  yield(a + b)
end

adding(1, 2) { |number| puts "Hello #{number}"}