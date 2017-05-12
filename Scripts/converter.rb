#!/usr/bin/env ruby
# CONVERTER
# BY SHADYFENNEC <shadyfennec@gmail.com>
# VER 0.3.2
# AUG 1 2016 12:00PM GMT+01:00
# PURPROSE : Encode any string to a user-specified base

###   ARGV   ###
ARGV << '--help' if ARGV.empty?
abort("Syntax error ! Please use --help if you need help") if ARGV[0] != '--help' and ARGV.length != 3
### END ARGV ###

###   HELP    ###
if ARGV[0] == "--help"
	puts "Encode any string to a user-specified base"
	puts "Syntax : number number_base output_base"
	puts "number : the number to encode"
	puts "number_base : the base of number. Example : for E21D41, specify 0123456789ABCDEF"
	puts "output_base : the base to encode number with. Example : to binary, specify 01"
end
### END HELP ###

###   INI   ###
number        = ARGV[0].to_s
number_a      = number.split(//)                                                 # Transforms the string in array
number_alph   = ARGV[1].to_s
number_alph_a = number_alph.split(//)
output_alph   = ARGV[2].to_s
output_alph_a = output_alph.split(//)
number_base   = number_alph.length
output_base   = output_alph.length

def index_in_alph(str, alph, array)                                              # Arranges in an array the decimal equivalent of a given character in an alphabet
	for i in 1..str.length
		array[i-1] = alph.index(str[i-1])
	end
end

def convert_array_to_base(array, base)                                           # Technically any base, but is used here in coordination with index_in_alph to transform the array in decimal
	converted_number = 0
	for i in 0..(array.length - 1)
		converted_number += (base ** (array.length - 1 -i)) * array[i]
	end
	return converted_number
end

def convert_decimal_to_base(num, base, alph)                                     # Converts any decimal number (base 10) in the user specified base
	string, quotient = "", num
	loop do
		quotient, remainder = (quotient).divmod(base)
		string.prepend(alph[remainder])
		break if quotient.zero?
	end
	return string
end
### END INI ###

###   ANALYSIS   ###
# Check if alphabets are valid
abort("Argument error : a character appears more than once in number_base") if number_alph_a.uniq.length != number_alph_a.length && ARGV[0] != '--help'
abort("Argument error : a character appears more than once in output_base") if output_alph_a.uniq.length != output_alph_a.length && ARGV[0] != '--help'
# Check if number is coherent with number_alph
if ARGV[0] == '--help' # If put on the same line, the two conditions cause an error due to a nil value
	abort()
else
	abort("Coherence error : a character in number does not appear in number_base") if !((number_a - number_alph_a).empty?)
end
### END ANALYSIS ###

###   PROCESSING   ###
# Encode number to decimal
number_decimal = 0
number_decimal_a = []
index_in_alph(number, number_alph, number_decimal_a)
number_decimal = convert_array_to_base(number_decimal_a, number_base)
# Encode decimal to output_base
encoded_number = convert_decimal_to_base(number_decimal, output_base, output_alph)
### END PROCESSING ###

###   OUTPUT   ###
puts "Encoding #{number} (base #{number_base.to_s}) into base #{output_base.to_s}"
puts "Result : #{encoded_number.to_s}"
### END OUTPUT ###
