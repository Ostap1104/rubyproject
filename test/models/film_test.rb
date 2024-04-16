require "test_helper"

class FilmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create a film record" do
    film = Film.new(name: "test", 
    year_of_creation: "2023", description: "a123123123123123", 
    genres: ['action'], duration: "50", director: "123123123123123")
    assert_equal film.save, true
  end
end
