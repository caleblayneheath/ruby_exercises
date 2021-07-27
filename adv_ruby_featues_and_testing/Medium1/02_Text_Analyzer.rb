require 'benchmark'

class TextAnalyzer
  def process
    # your implementation
    # file = File.open('sample.txt')
    # yield(file.read)
    # file.close
    yield File.read('sample.txt')
  end
end

analyzer = TextAnalyzer.new
p Benchmark.realtime { 
  analyzer.process { |text| p text.split("\n\n").size }
  analyzer.process { |text| p text.split("\n").size }
  analyzer.process { |text| p text.split.size } # { your implementation }
}
# analyzer.process # { your implementation }
# analyzer.process # { your implementation }

# file = File.open('sample.txt') { |f| f.readlines }.size # lines
# file = File.open('sample.txt') { |f| f.readlines('') }.size # paragraphs
# file = File.open('sample.txt') { |f| f.readlines.map(&:split).flatten.size} # words


# 3 paragraphs
# 15 lines
# 126 words