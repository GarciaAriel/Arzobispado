class AddReportedcomments < ActiveRecord::Migration
  def change
  	 create_table :reported_comments do |t|
    	t.references :comment, index: true
    end
  end
end
