json.extract! @user, :name, :description, :rating
json.skills @user.skills, :id, :name