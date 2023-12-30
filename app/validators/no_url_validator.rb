class NoUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # URI.extract("text here http://foo.example.org/bla and here mailto:test@example.com and here also.")
    # # => ["http://foo.example.com/bla", "mailto:test@example.com"]
    urls = URI.extract(value)
    return if urls.empty?

    record.errors.add(attribute, (options[:message] || I18n.t('cannot_contain_url')))
  end
end
