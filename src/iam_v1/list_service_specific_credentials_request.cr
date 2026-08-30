private alias Core = Amazonite::Core

module Amazonite::IamV1
  class ListServiceSpecificCredentialsRequest
    # The name of the user whose service-specific credentials you want information about. If this
    # value is not specified, then the operation assumes the user whose credentials are used to call
    # the operation.
    #
    # This parameter allows (through its [regex pattern](http://wikipedia.org/wiki/regex)) a string of
    # characters consisting of upper and lowercase alphanumeric characters with no spaces. You can
    # also include any of the following characters: _+=,.@-
    property user_name : String | Nil

    # Filters the returned results to only those for the specified Amazon Web Services service. If not
    # specified, then Amazon Web Services returns service-specific credentials for all services.
    property service_name : String | Nil

    # A flag indicating whether to list service specific credentials for all users. This parameter
    # cannot be specified together with UserName. When true, returns all credentials associated with
    # the specified service.
    property all_users : Bool | Nil

    # Use this parameter only when paginating results and only after you receive a response indicating
    # that the results are truncated. Set it to the value of the Marker from the response that you
    # received to indicate where the next call should start.
    property marker : String | Nil

    # Use this only when paginating results to indicate the maximum number of items you want in the
    # response. If additional items exist beyond the maximum you specify, the IsTruncated response
    # element is true.
    property max_items : Int32 | Nil

    def initialize(
      @user_name : String | Nil = nil,
      @service_name : String | Nil = nil,
      @all_users : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @user_name
        params << {"#{prefix}UserName", value}
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      if value = @all_users
        params << {"#{prefix}AllUsers", Core::QueryValue.bool(value)}
      end

      if value = @marker
        params << {"#{prefix}Marker", value}
      end

      if value = @max_items
        params << {"#{prefix}MaxItems", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        user_name: Core::XMLValue.string(node.xpath_node("*[local-name()='UserName']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='ServiceName']")),
        all_users: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllUsers']")),
        marker: Core::XMLValue.string(node.xpath_node("*[local-name()='Marker']")),
        max_items: Core::XMLValue.i32(node.xpath_node("*[local-name()='MaxItems']")),
      )
    end

    def validate! : Nil
      if value = @user_name
        raise Core::ValidationError.new("UserName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("UserName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("UserName does not match the required pattern") unless value.matches?(Regex.new("^[\\w+=,.@-]+$"))
      end

      if value = @marker
        raise Core::ValidationError.new("Marker length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Marker length must be <= 320") if value.size > 320
        raise Core::ValidationError.new("Marker does not match the required pattern") unless value.matches?(Regex.new("^[\\u0020-\\u00FF]+$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@user_name, @service_name, @all_users, @marker, @max_items)
  end
end
