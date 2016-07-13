class CreateAnswersVotes < ActiveRecord::Migration
  def change
  	  	create_table :answers_votes do |a|
  		a.belongs_to :answer, index: true
  		a.integer :vote_like
  		a.integer :vote_dislike

  		a.timestamp null: false
  	end
  end
end
