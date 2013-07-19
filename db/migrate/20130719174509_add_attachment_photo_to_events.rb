class AddAttachmentPhotoToEvents < ActiveRecord::Migration
  def change
    add_attachment :events, :photo
  end
end
