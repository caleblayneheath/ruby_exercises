def staggered_case(string, count_special = false)
  results = ''
  make_upper = true
  
  string.chars.each do |char|
    make_upper ? results << char.upcase : results << char.downcase 
    
    if count_special
      make_upper = !make_upper
    else
      make_upper = !make_upper if char =~ /[a-zA-Z]/
    end
  end

  results
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('ab*cd')
p staggered_case('ab*cd', true)