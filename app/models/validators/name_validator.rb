class NameValidator < ActiveModel::Validator

	def validate(record)

		if record.title.nil?

			record.errors.add(:title, 'Le champs doit est obligatoire')
		end


	end
	
end