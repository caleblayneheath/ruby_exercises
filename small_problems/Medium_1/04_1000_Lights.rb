# any perfect square is toggled an odd number of times
# so they will always end up on if initially off

def return_on_switches(number_of_switches)
  # switches = {}
  # 1.upto(number_of_switches) do |num|
  #   switches[num] = :off
  # end

  switches = Hash.new { |hash, key| hash[key] = :off }
  1.upto(number_of_switches) { |num| switches[num] }

  1.upto(number_of_switches) do |round|
    switches.keys.each do |switch_number|
      if (switch_number % round).zero?
        switches[switch_number] = flip_switch(switches[switch_number])
      end
    end
  end

  # switches.keys.select { |switch_number| switches[switch_number] == :on }
  switches.select { |_number, state| state == :on }.keys
end

def flip_switch(switch)
  switch == :on ? :off : :on
  # return :off if switch == :on
  # return :on  if switch == :off
end

p return_on_switches(5) == [1, 4]
p return_on_switches(10) == [1, 4, 9]
