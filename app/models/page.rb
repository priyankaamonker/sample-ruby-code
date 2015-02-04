class Page < ActiveRecord::Base
  validates :title, :content, presence: true
  validates :title, uniqueness: true
  def self.latest
    Page.order(:updated_at).last
  end
end
