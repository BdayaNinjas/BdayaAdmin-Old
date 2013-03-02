# Author: Hazem Tawfik
class Authority
  include Mongoid::Document

  field :name, type:String
  field :tuples, type:Array

# We should already have authorities (for each action on the website) created like Committies first on launching the website in the Seeds file
	
	# On the authorities page in the admin view he can show every action on the website and the corresbonding authorities in multiple drop-down lists that can be added as more than one
	
	# It'll be saved when updating Authorities page in Admin, in the form (example):
		# auth = Authority.find_by(name: "update_yes")
		# auth.tuples = Params[tuples] // if updating the whole authorities of that Authority
			# or// auth.tuples << Params[tuples] // when just adding new authority
		# auth.save

	# The Authority will be in the form:
		# name => "edit_yes"
		# tuples => [[yes(a Committee Object), "head"],[geneh, "vices"], [geneh, "members"]]
	
	# Easily this way,, You can just check the authorization of a user in the form:
		# Authority.has_authority(Member.last, "create_geneh_case")

  def has_authority(user, action)
  	auth = Authority.find_by(name: action)
  	if(auth != nil)
  		flag = false
  		auth.tuples.each do |ath|
  			if(ath[1] == "head")
  				if(ath[0].head == user)
  					flag = true
  				end
  			elsif(ath[1] == "vices")
  				if(ath[0].vices.include?(user))
  					flag = true
  				end
  			elsif(ath[1] == "members")
  				if(ath[0].members.include?(user))
  					flag = true
  				end
  			end
  		end
  		return flag
  	else
      return false
    end
  end

end