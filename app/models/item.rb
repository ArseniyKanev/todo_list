class Item < ActiveRecord::Base
  belongs_to :list
  validates :content, presence: true

  def done?
  	done
  end
end
