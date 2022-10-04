class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
    validate :title_contains_clickbait

    TITLE_CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top/i,
        /Guess/i

    ]
    def title_contains_clickbait
        if TITLE_CLICKBAIT.none? { |word| word.match title}
            errors.add(:title, "Title not clickbaity enough")
        end
    end
end
