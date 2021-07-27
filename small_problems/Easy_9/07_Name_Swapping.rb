# def swap_name(name)
#   names = name.split
#   "#{names.last}, #{names.first}"
# end

# Launch School
def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
