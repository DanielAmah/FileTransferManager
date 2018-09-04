class FileUpload < ApplicationRecord
  has_many_attached :files
  validates :name, presence: true
  validate :file_attached


  private

  def file_attached
    if files.attached? == false
      files.purge_later
      errors[:base] << 'File is not attached'
    elsif files.attached?
      files.each do |file|
        if file.byte_size > 10485760
          file.purge
          errors[:base] << 'File is too large. It has to be below 10MB'
        end
      end
    end
  end
end
