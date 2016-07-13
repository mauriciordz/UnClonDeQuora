class CreateQuestionsVotes < ActiveRecord::Migration
  def change
  	  	create_table :questions_votes do |a|
  		a.belongs_to :question, index: true
  		a.integer :vote_like
  		a.integer :vote_dislike

  		a.timestamp null: false
  	end
  end
end
