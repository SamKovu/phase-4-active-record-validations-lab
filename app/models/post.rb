class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    
    validate  :title_is_clickbait

    def title_is_clickbait
        if title.present? && !title.match(/Won't Believe|Secret|Top \d|Guess/)
                errors.add(:title, "Needs more clickbait!")
        end
    end

   

end
