# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
 # def director
 #   key = self.director_id

 #   matching_set = Director.where({ :id => key })

 #   the_one = matching_set.at(0)

 #   return the_one
 # end
  belongs_to(:director)
  has_many(:characters)

  def cast
      the_many = Array.new

      self.characters.each.do |joining_record|
        destination_record = joingin_record.actor
        the_many.push(destination_record)
      end
      return the_many.flatten
  end
end
