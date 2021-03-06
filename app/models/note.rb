class Note < ApplicationRecord
  belongs_to :user

  has_rich_text :content

  validate :title_or_content_present?

  after_initialize :set_defaults

  def public_attributes
    [:title, :content]
  end

  def set_defaults
    self.type ||= 'Note'
  end

  private
  def title_or_content_present?
    if self.title.blank? && self.content.blank?
      errors.add :base, 'At least one of title or content must exist'
    end
  end
end
