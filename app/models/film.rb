class Film < ApplicationRecord
    GENRES = %w[action comedy drama horror romance thriller sci-fi fantasy animation documentary musical western].freeze
    has_many :comments, as: :commentable, dependent: :destroy
    # validates :name, :year_of_creation, presence:true
    # validates :description, length: {minimum: 10}
    # validates :year_of_creation, numericality: { only_integer: true, greater_than_or_equal_to: 2000 }
    # validates :director, presence:true
    # validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 30 }
    # validates :name, uniqueness: { scope: :year_of_creation}
    # validate :genres_validation
    
    private

    def genres_validation
    unless genres.is_a?(Array) && genres.any?{ |genre|genre.present?}
        errors.add("genres","invalid")
        end
    end
end