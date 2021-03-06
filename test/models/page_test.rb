require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "page attributes must not be empty" do
  page = Page.new
  assert page.invalid?
  assert page.errors[:title].any?
  assert page.errors[:content].any?
end

test "page is not valid without a unique title" do
  page = Page.new(title:       pages(:ruby).title,
                        content: "yyy",
                        defaut:     0)
 
  assert page.invalid?
  assert_equal ["has already been taken"], page.errors[:title]
end
end
