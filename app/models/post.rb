class Post < ApplicationRecord

	validates :title, name: true
	validates :slug, format: { with: /\A[a-z0-9\-]+\z/}, uniqueness: true
	before_validation :default_slug

	def as_json(options = nil)

		super(only: [:title, :id])

	end

	def default_slug
		if self.title.empty?

			throw :abort

		end
		if !self.title.nil? && !self.title.empty? && (self.slug.nil? || self.slug.empty?)
		  
		  self.slug = title.parameterize

		end

	end


end