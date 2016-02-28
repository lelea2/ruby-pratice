#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  #Implement the following read-only attributes in the LineAnalyzer class.
  attr_reader :highest_wf_count #* highest_wf_count - a number with maximum number of occurrences for a single word (calculated)
  attr_reader :highest_wf_words #* highest_wf_words - an array of words with the maximum number of occurrences (calculated)
  attr_reader :content   #* content          - the string analyzed (provided)
  attr_reader :line_number   #* line_number      - the line number analyzed (provided)

  #Add the following methods in the LineAnalyzer class.
  #* initialize() - taking a line of text (content) and a line number
  #* calculate_word_frequency() - calculates result

  #Implement the initialize() method to:
  #* take in a line of text and line number
  #* initialize the content and line_number attributes
  #* call the calculate_word_frequency() method.
  def initialize(content, line_number)
    @content = content
    @line_number = line_number

    calculate_word_frequency
  end

  #Implement the calculate_word_frequency() method to:
  #* calculate the maximum number of times a single word appears within
  #  provided content and store that in the highest_wf_count attribute.
  #* identify the words that were used the maximum number of times and
  #  store that in the highest_wf_words attribute.
  def calculate_word_frequency
    @highest_wf_words = []
    @highest_wf_count = 0

    temp_words = {} #hash variable to store words count
    my_content = @content.downcase.split # split sentence to word
    #p my_content
    my_content.each do |word|
      temp_words[word] = my_content.count(word)
    end

    @highest_wf_count = temp_words.values.max
    #p @highest_wf_count

    if temp_words.values.count(@highest_wf_count) == temp_words.values.length
      @highest_wf_words.concat(temp_words.keys) #concat to store string that most repeated
    elsif temp_words.values.count(@highest_wf_count) != 1
      index = 0
      temp_words.values.each do |hightest_frequency|
        if hightest_frequency == @highest_wf_count
          @highest_wf_words << temp_words.keys[index]
        end
        index += 1
      end
    else
      index = temp_words.values.index(@highest_wf_count)
      @highest_wf_words << temp_words.keys[index]
    end
  end
end

#  Implement a class called Solution.
class Solution

  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute
  #  equal to the highest_count_across_lines determined previously.
  attr_reader :analyzers
  attr_reader :highest_count_across_lines
  attr_reader :highest_count_words_across_lines

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and
  #  highest_count_words_across_lines attribute values
  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in
  #  highest_count_words_across_lines in the specified format
  def initialize
    @analyzers = []
  end

  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines
  #* Create an array of LineAnalyzers for each line in the file
  def analyze_file
    line_number = 1
    if File.exist?("test.txt")
      #check files exists, read and put in @analyzers variable
      file = File.open("test.txt", "r") do |f|
        f.each_line do |line|
          @analyzers << LineAnalyzer.new(line, line_number)
          line_number += 1
        end
      end
    end
  end

  # Implement the calculate_line_with_highest_frequency() method to:
  def calculate_line_with_highest_frequency
    temp_arr = []
    @highest_count_words_across_lines = []
    # Store highest count in temp_arr
    #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
    #  and stores this result in the highest_count_across_lines attribute.
    @analyzers.each do |obj|
      temp_arr << obj.highest_wf_count
    end
    @highest_count_across_lines = temp_arr.max

    #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines
    # attribute value determined previously and stores them in highest_count_words_across_lines.
    @analyzers.each do |obj|
      if obj.highest_wf_count == @highest_count_across_lines
        @highest_count_words_across_lines << obj
      end
    end
  end

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
  # def print_highest_word_frequency_across_lines
  def print_highest_word_frequency_across_lines
    @highest_count_words_across_lines.each do |obj|
      puts "#{obj.highest_wf_words} (appears in line #{obj.line_number})"
    end
  end
end
