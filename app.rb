require 'sinatra'
require_relative 'isbn.rb'

get '/' do
	# 'Hello World'
	# 'Cool Stuff'

erb :isbn_input, :locals => {:isbn_number => "", :results => "", :message_one =>"", :number => ""}

end

post '/isbn_num' do
	isbn_num = params[:isbn_input]

results = valid_isbn?(isbn_num)
# "#{results}, this is a valid ISBN."

erb :isbn_input, :locals => {:isbn_number => isbn_num, :results => results, :message_one => " is a ", :number => " ISBN"}

end
