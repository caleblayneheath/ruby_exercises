def convert_to_base_8(n)
  # n.method_name.method_name # replace these two method calls
  n.to_s(8).to_i
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8)#.to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# [10, 12, 14, 16, 20, 41]