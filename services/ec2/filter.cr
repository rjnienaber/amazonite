private alias Core = Amazonite::Core

module Amazonite::EC2
  # A filter name and value pair that is used to return a more specific list of results from a
  # describe operation. Filters can be used to match a set of resources by specific criteria, such
  # as tags, attributes, or IDs.
  #
  # If you specify multiple filters, the filters are joined with an `AND`, and the request returns
  # only results that match all of the specified filters.
  #
  # For more information, see [List and filter using the CLI and
  # API](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Filtering.html#Filtering_Resources_CLI)
  # in the *Amazon EC2 User Guide*.
  class Filter
    # The name of the filter. Filter names are case-sensitive.
    property name : String | Nil

    # The filter values. Filter values are case-sensitive. If you specify multiple values for a
    # filter, the values are joined with an `OR`, and the request returns all results that match any
    # of the specified values.
    property values : Array(String) | Nil

    def initialize(
      @name : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @name
        params << {"#{prefix}Name", value}
      end

      (@values || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}Value.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        name: Core::XMLValue.string(node.xpath_node("*[local-name()='Name']")),
        values: node.xpath_nodes("*[local-name()='Value']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@name, @values)
  end
end
