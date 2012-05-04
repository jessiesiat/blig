=begin
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
=end

class Post < ActiveRecord::Base
	validates :name, :presence => true
	#validates :email, :email => true
	validates :title, :presence => true,
					  :length => { :minimum => 5 }
					  
	has_many :comments, :dependent => :destroy
	has_many :tags
	
	accepts_nested_attributes_for :tags, :allow_destroy => :true,
		:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
		
    #callbacks
	after_find do |post|
		puts "object found!"
	end
	
	after_initialize do |post|
		puts "object initialized!"
	end
	
end
