class Mail < ActiveRecord::Base
attr_accessible :from, :to, :from_name, :subject, :message
set_primary_key "id"
validates :from, :to,:presence=>true,:format=>{:with=>/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,:message=>" : Enter valid email address"}
end
