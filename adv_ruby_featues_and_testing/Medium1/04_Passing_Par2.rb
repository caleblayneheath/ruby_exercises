def assign(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)

assign(birds) { |_, _, *raptors| p raptors}