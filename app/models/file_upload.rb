class FileUpload < ApplicationRecord
  has_many_attached :files
end
