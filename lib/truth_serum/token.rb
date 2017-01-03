# frozen_string_literal: true
module TruthSerum
  class Token
    VALID_TYPES = [
      :term,
      :colon,
      :space,
      :plus,
      :minus
    ].freeze

    attr_accessor :type, :text

    def initialize(type, text)
      @type = type
      @text = text
    end

    def valid?
      VALID_TYPES.include?(@type) &&
        !@text.nil? &&
        !@text.empty?
    end

    VALID_TYPES.each do |type|
      define_method "#{type}?" do
        @type == type
      end
    end
  end

  class NilToken < Token
    def initialize
      super(:nil, '')
    end
  end
end
