private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  # Filter criteria to use in determining which extensions to return.
  class TypeFilters
    # The category of extensions to return.
    #
    # - `REGISTERED`: Private extensions that have been registered for this account and Region.
    #
    # - `ACTIVATED`: Public extensions that have been activated for this account and Region.
    #
    # - `THIRD_PARTY`: Extensions available for use from publishers other than Amazon. This includes:
    #
    # - Private extensions registered in the account.
    #
    # - Public extensions from publishers other than Amazon, whether activated or not.
    #
    # - `AWS_TYPES`: Extensions available for use from Amazon.
    property category : Category | Nil

    # The id of the publisher of the extension.
    #
    # Extensions published by Amazon aren't assigned a publisher ID. Use the `AWS_TYPES` category to
    # specify a list of types published by Amazon.
    property publisher_id : String | Nil

    # A prefix to use as a filter for results.
    property type_name_prefix : String | Nil

    def initialize(
      @category : Category | Nil = nil,
      @publisher_id : String | Nil = nil,
      @type_name_prefix : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @category
        params << {"#{prefix}Category", value.to_json_object_key}
      end

      if value = @publisher_id
        params << {"#{prefix}PublisherId", value}
      end

      if value = @type_name_prefix
        params << {"#{prefix}TypeNamePrefix", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        category: (n = node.xpath_node("*[local-name()='Category']")) ? ACF::Category.from_json_object_key?(n.content) : nil,
        publisher_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PublisherId']")),
        type_name_prefix: Core::XMLValue.string(node.xpath_node("*[local-name()='TypeNamePrefix']")),
      )
    end

    def validate! : Nil
      if value = @publisher_id
        raise Core::ValidationError.new("PublisherId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PublisherId length must be <= 40") if value.size > 40
        raise Core::ValidationError.new("PublisherId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-zA-Z]{12,40}$"))
      end

      if value = @type_name_prefix
        raise Core::ValidationError.new("TypeNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TypeNamePrefix length must be <= 204") if value.size > 204
        raise Core::ValidationError.new("TypeNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^([A-Za-z0-9]{2,64}::){0,2}([A-Za-z0-9]{2,64}:?){0,1}$"))
      end
    end

    def_equals_and_hash(@category, @publisher_id, @type_name_prefix)
  end
end
