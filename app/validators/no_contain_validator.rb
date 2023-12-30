class NoContainValidator < ActiveModel::EachValidator
  EMAIL_REGEX = /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i

  def validate_each(record, attribute, value)
    format = options[:format] || EMAIL_REGEX
    return unless value.scan(format).present?

    record.errors.add(attribute, (options[:message] || I18n.t('cannot_contain_email')))
  end
end
